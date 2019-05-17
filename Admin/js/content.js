
$(document).ready(function () {
    $("a").click(function (e) {
        e.preventDefault();
        $("#frameId").attr('src', $(this).attr("href"));
    });

    $("li").click(function () {
        $("li").removeClass("active");
        $(this).addClass("active");
    });
});