<!--====================================
=            Navigation Top            =
=====================================-->

<?php $this->load->view('includes/home-navbar'); ?>

<!--====  End of Navigation Top  ====<--></-->
<?php
$this->load->view('includes/home-sidenav');
?>
<!--ABOVE IS PERMA-->

<br><br>
<div class="container">
    <div class="row" style="margin-top: 50px">
        <div class="col s1"></div>
        <div class="col s2">
            <img class="circle responsive-img" src="http://www.bu.edu/com/files/2015/08/Guo_Lei.jpg">
        </div>
        <div class="col s4">
            <span class='black-text'>
                <?= $lect["firstname"] . " " . $lect["midname"] . " " . $lect["lastname"] ?>
            </span>
            <br>
            <span class='grey-text'>
                <?= $lect["expertise"] ?>
            </span>

        </div>
        <div class="col s5"></div>
    </div>
    <form method="post" action="<?= base_url() ?>feedback/submit">
        <div class="row" style="margin-top: -50px">
            <div class="col s3"></div>
            <div class="col s8">

                <div class="input-field col s12">
                    <textarea name="feedback_content" class="materialize-textarea" data-length="500"  maxlength="500" required autofocus></textarea>
                    <label for="textarea1">Feedback Here</label>
                </div>
            </div>
            <div class="col s1"></div>
        </div>
        <center>
            <button class="btn waves-effect waves-light green" type="submit" style="margin-top:50px;">
                <i class="material-icons right">send</i>
                Submit
            </button>
        </center>
    </form>
</div>