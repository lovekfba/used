




$(document).ready(function() {
    console.log("111");
    $(`.ham_img`).click(function () {
        $(this).parent('.ham_box').next('.ham_1').slideToggle()
    })

    $(`.ham_img`).click(function () {
        $(this).parent('.ham_box').next('.ham_1').next(".ham_2").slideToggle()
    })



    $(`.btn_ham`).click(function () {
        $(`.draw_per`).css({
            opacity: "0.5"
        });

        $(`.draw_per`).css({
            pointerEvents: "auto"
        });

        console.log("자크동");
        $(`.ham_pan`).animate({
            right: "0"
        }, 500)
    })


    $(`.draw_per`).click(function () {
        $(`.draw_per`).css({
            opacity: "0"
        });

        $(`.ham_pan`).animate({
            right: "-600px"
        }, 500)

        $(`.draw_per`).css({
            pointerEvents: "none"
        });


    })


    $(document).on('click', '.ham_close', function () {
        $(`.draw_per`).css({
            opacity: "0"
        });

        $(`.draw_per`).css({
            pointerEvents: "none"
        });

        $(`.ham_pan`).animate({
            right: "-600px"
        }, 500)
    });
});