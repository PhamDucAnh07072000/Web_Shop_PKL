<%@page pageEncoding="UTF-8" %>

<!-- container-scroller -->

<!-- plugins:js -->
<script src="/backend/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="/backend/vendors/chart.js/Chart.min.js"></script>
<script src="/backend/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="/backend/vendors/progressbar.js/progressbar.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/backend/js/off-canvas.js"></script>
<script src="/backend/js/hoverable-collapse.js"></script>
<script src="/backend/js/template.js"></script>
<script src="js/settings.js"></script>
<script src="js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="/backend/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/backend/js/dashboard.js"></script>
<script src="/backend/js/Chart.roundedBarCharts.js"></script>
<!-- End custom js for this page-->

<script>

    $("#fileUploadId").on("change", function (e) {
        var file = $(this)[0].files[0];// lấy file

        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('outputImage');
            output.src = reader.result;
        };
        reader.readAsDataURL(file);
        var formData = new FormData();

        // add assoc key values, this will be posts values
        formData.append("file", file, file.name);
        formData.append("upload_file", true);

        $.ajax({// gọi api từ client lên server
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/BackEnd/Common/uploadFileCategory",
            xhr: function () {
                var myXhr = $.ajaxSettings.xhr();
                // if (myXhr.upload) {
                //     myXhr.upload.addEventListener('progress', that.progressHandling, false);
                // }
                return myXhr;
            },
            success: function (data) {
                if (data.status == 1) {
                    $("#fileUploadName").val(data.data);
                    alert("Tải file " + data.data + " thành công");
                }
                else alert("Tải file " + data.data + " thất bại");
            },
            error: function (error) {
                // handle error
            },
            async: true,
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            timeout: 60000
        });
    });
    var imagesPreview = function(input, placeToInsertImagePreview) {
        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function(event) {
                    $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };
</script>