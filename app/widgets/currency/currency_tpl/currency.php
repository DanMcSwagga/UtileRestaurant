<option value="" class="currency-option"><?= $this->currency['code']; ?></option>
<?php foreach ($this->currencies as $key => $value): ?>
    <?php if ($key != $this->currency['code']): ?>
        <option value="<?= $key; ?>" class="currency-option"><?= $key; ?></option>
    <?php endif; ?>
<?php endforeach; ?>