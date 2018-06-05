<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark">Product edit <?= $product->title; ?></h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= ADMIN; ?>">Main</a></li>
                    <li class="breadcrumb-item"><a href="<?= ADMIN; ?>/product">List of products</a></li>
                    <li class="breadcrumb-item active">Product edit</li>
                </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <form action="<?=ADMIN;?>/product/edit" method="post" data-toggle="validator">
                        <div class="box-body">
                            <div class="form-group has-feedback">
                                <label for="title">Product title</label>
                                <input autocomplete="off" type="text" name="title" class="form-control" id="title" placeholder="Product title" value="<?=h($product->title);?>" required>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            </div>

                            <div class="form-group">
                                <label for="category_id">Category ID</label>
                                <input type="number" min="1" max="4" name="category_id" class="form-control" id="category_id" placeholder="Category ID" value="<?=h($product->category_id);?>">
                            </div>

                            <div class="form-group">
                                <label for="keywords">Keywords</label>
                                <input autocomplete="off" type="text" name="keywords" class="form-control" id="keywords" placeholder="Keywords" value="<?=h($product->keywords);?>">
                            </div>

                            <div class="form-group">
                                <label for="description">Description</label>
                                <input autocomplete="off" type="text" name="description" class="form-control" id="description" placeholder="Description" value="<?=h($product->description);?>">
                            </div>

                            <div class="form-group has-feedback">
                                <label for="price">Price</label>
                                <input autocomplete="off" type="text" name="price" class="form-control" id="price" placeholder="Price" pattern="^[0-9.]{1,}$" value="<?=$product->price;?>" required data-error="Only digits and a . symbol">
                                <div class="help-block with-errors"></div>
                            </div>

                            <div class="form-group has-feedback">
                                <label for="content">Short content</label>
                                <textarea name="content" id="editor1" cols="80" rows="4"><?=$product->content;?></textarea>
                            </div>

                            <div class="form-group has-feedback">
                                <label for="full_content">Full content</label>
                                <textarea name="full_content" id="editor2" cols="80" rows="10"><?=$product->full_content;?></textarea>
                            </div>

                            <div class="form-group has-feedback">
                                <label for="ingredients">Ingredients</label>
                                <textarea name="ingredients" id="editor3" cols="80" rows="4"><?=$product->ingredients;?></textarea>
                            </div>

                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="status" <?=$product->status ? ' checked' : null;?>> Status
                                </label>
                            </div>

                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="special" <?=$product->special ? ' checked' : null;?>> Special
                                </label>
                            </div>

                            <!--                            <div class="form-group">-->
                            <!--                                <div class="col-md-4">-->
                            <!--                                    <div class="box box-danger box-solid file-upload">-->
                            <!--                                        <div class="box-header">-->
                            <!--                                            <h3 class="box-title">Image</h3>-->
                            <!--                                        </div>-->
                            <!--                                        <div class="box-body">-->
                            <!--                                            <div id="single" class="btn btn-success" data-url="product/add-image" data-name="single">Choose file</div>-->
                            <!--                                            <p><small>Recommended size: 1000x1000</small></p>-->
                            <!--                                            <div class="single"></div>-->
                            <!--                                        </div>-->
                            <!--                                        <div class="overlay">-->
                            <!--                                            <i class="fa fa-refresh fa-spin"></i>-->
                            <!--                                        </div>-->
                            <!--                                    </div>-->
                            <!--                                </div>-->
                            <!--                            </div>-->

                        </div>
                        <div class="box-footer">
                            <input type="hidden" name="id" value="<?=$product->id;?>">
                            <button type="submit" class="btn btn-success">Сохранить</button>
                        </div>
                    </form>
                    <?php if(isset($_SESSION['form_data'])) unset($_SESSION['form_data']); ?>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- /.content -->