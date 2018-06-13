<?php

namespace utile;

//use PDO;

class SQL {

    protected $commands = [];
    protected $params = [];
    protected $statement = "";
    protected $pdo;
    protected $previous = "";

    public function __construct(PDO $pdo) {
        $this->pdo = $pdo;
    }

    private static function compoundName(string $str): string {
        if (preg_match("/^[a-z\_][a-z0-9\_]*\.[a-z\_][a-z0-9\_]*$/", $str))
        {
            $temp = explode('.', $str);
            return '`' . $temp[0] . '`.`' . $temp[1] . '`';
        }
        return '`' . $str . '`';
    }

    public function select(string ... $fields): self {

        $this->statement .= "SELECT ";

        if (empty($fields))
            $this->statement .= '* ';
        else {
            $i = 0;
            while ($i < count($fields) - 1) {
                $fields[$i] = self::compoundName($fields[$i]);
                $this->statement .= $fields[$i];
                $this->statement .= ', ';
                $i++;
            }
            $fields[$i] = self::compoundName($fields[$i]);
            $this->statement .= $fields[$i];
        }

        $this->statement .= ' ';
        return $this;
    }

    public function update(string $firstTable, string ... $tables): self {
        $this->statement .= "UPDATE ";
        $this->statement .= self::compoundName($firstTable);

        foreach ($tables as $table) {
            $this->statement .= ', ';
            $this->statement .= self::compoundName($table);
        }

        $this->statement .= ' ';
        return $this;
    }

    public function innerJoin(string $anotherTable): self {
        $this->statement .= "INNER JOIN ";
        $this->statement .= self::compoundName($anotherTable) . ' ';

        $this->previous = "INNER JOIN ";
        return $this;
    }

    public function on(string $placeholder1, string $condition, string $placeholder2): self {
        if ($this->previous == "ON ")
            $this->statement .= ', ';
        else
            $this->statement .= "ON ";

        $this->statement .= $placeholder1 . ' ';
        $this->statement .= $condition . ' ';
        $this->statement .= $placeholder2 . ' ';

        $this->previous = "ON ";
        return $this;
    }

    public function delete(string $firstTable, string ... $tables): self {
        $this->statement .= "DELETE ";

        $this->from($firstTable, ... $tables);
        return $this;
    }

    public function set(string $field, string $valuePlaceholder): self {
        if ($this->previous != "SET ")
            $this->statement .= "SET ";
        else
            $this->statement .= ', ';

        $this->statement .= '`' . $field . '` ';
        $this->statement .= "= ";
        $this->statement .= $valuePlaceholder . ' ';

        $this->previous = "SET ";
        return $this;
    }

    public function insert(string $field1, string ... $otherFields): self {
        $this->statement .= "INSERT ";
        $this->statement .= '(';

        $this->statement .= self::compoundName($field1);

        foreach ($otherFields as $field) {
            $this->statement .= ', ';
            $this->statement .= self::compoundName($field);
        }

        $this->statement .= ') ';
        return $this;
    }

    public function into(string $table): self {
        $after = substr($this->statement, strpos($this->statement, "INSERT ") + 7);
        $localQuery = "INTO " . self::compoundName($table) . ' ' . $after;
        $this->statement = substr_replace($this->statement, $localQuery, strpos($this->statement, "INSERT ") + 7);
        return $this;
    }

    public function values(string $placeholder1, string ... $otherPlaceholders) {

        if ($this->previous == "VALUES ")
            $this->statement .= ', ';
        else
            $this->statement .= "VALUES ";

        $this->statement .= '(';

        $this->statement .= $placeholder1;

        foreach ($otherPlaceholders as $placeholder) {
            $this->statement .= ', ';
            $this->statement .= $placeholder;
        }
        $this->statement .= ') ';

        $this->previous = "VALUES ";
        return $this;
    }


    public function from(string $firstTable, string ... $tables): self {
        $this->statement .= "FROM ";
        $this->statement .= '`' . $firstTable . '`';

        foreach ($tables as $table)
        {
            $this->statement .= ', ';
            $this->statement .= '`' . $table . '`';
        }

        $this->statement .= ' ';
        return $this;
    }

    public function where(string $placeholder1, string $operator, string $placeholder2): self {
        $this->statement .= "WHERE ";
        $this->statement .= $placeholder1 . ' ';
        $this->statement .= $operator . ' ';
        $this->statement .= $placeholder2 . ' ';
        $this->statement .= ' ';
        return $this;
    }

    public function or (string $placeholder1, string $operator, string $placeholder2): self {
        $this->statement .= "OR ";
        $this->statement .= $placeholder1 . ' ';
        $this->statement .= $operator . ' ';
        $this->statement .= $placeholder2 . ' ';
        $this->statement .= ' ';
        return $this;
    }

    public function and (string $placeholder1, string $operator, string $placeholder2): self {
        $this->statement .= "AND ";
        $this->statement .= $placeholder1 . ' ';
        $this->statement .= $operator . ' ';
        $this->statement .= $placeholder2 . ' ';
        $this->statement .= ' ';
        return $this;
    }

    public function orderby(string $firstField, string ... $otherFields): self {
        $this->statement .= "ORDER BY ";
        $this->statement .= self::compoundName($firstField);

        foreach ($otherFields as $fields)
        {
            $this->statement .= ', ';
            $this->statement .= '`' . $fields . '`';
        }
        return $this;
    }

    public function execute(array $params = []) {
        $this->statement = trim($this->statement);
        $pdostatement = $this->pdo->prepare($this->statement);

        $command = explode(' ', trim($pdostatement->queryString));

        $pdostatement->execute($params);
        if ($command[0] == 'SELECT')
            return $pdostatement->fetchAll();
        return $pdostatement;
    }

}