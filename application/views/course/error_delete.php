<script>
    $(document).ready(function () {
        swal({
        title: "Error",
                text: "There is an error occured while updating the data",
                icon: "warning",
                buttons: true,
                dangerMode: true
                closeOnClickOutside: false
        }).then((willDelete) <?= "=>" ?>{
        if (willDelete) {
            window.location.href = "<?= base_url() . "Course" ?>";
        } else {
            window.location.href = "<?= base_url() . "Course" ?>";
            }
        }
        );
    });
</script>