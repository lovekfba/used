$(document).ready(function () {
    // console.log($(`.item_box${i}`).children($(`.item_box${i}`).children(`.item${i}`)).length)
    let menu_w = $($(`.item_box0`).children(`.item0`)).outerWidth() + 10;
    let menu_l = $($(`.item_box0`).children(`.item0`)).length;
    let menu_c = $(`.sec`).length;
    console.log($('.item_box0').children(`.item0`).length);

    let bangArray = new Array(menu_c).fill(0); // 각 섹션에 대한 개별 카운터 초기화

    for (let j = 0; j < menu_c; j++) {
        for (let i = 0; i < menu_l; i++) {
            console.log($(`.item_box${j}`).children(`.item`).length);
            $($(`.item_box${j}`).children(`.item`)).eq(i).css({left: menu_w * i});
        }

        $(`.aside_btn_right${j}`).click(function () {
            $(`.aside_btn`).css({
                pointerEvents: `none`
            });

            setTimeout(function () {
                $(`.aside_btn`).css({pointerEvents: `auto`});
            }, 200);

            $($(`.item_box${j}`).children(`.item${j}`)).animate({
                left: `-=${menu_w}`
            }, 200);

            $($(`.item_box${j}`).children(`.item${j}`)).eq(bangArray[j] % menu_l).animate({
                left: menu_w * (menu_l - 1)
            }, 0);

            bangArray[j] += 1;
        });

        $(`.aside_btn_left${j}`).click(function () {
            $(`.aside_btn`).css({pointerEvents: `none`});

            setTimeout(function () {
                $(`.aside_btn`).css({pointerEvents: `auto`});
            }, 200);

            $($(`.item_box${j}`).children(`.item${j}`)).eq((bangArray[j] - 1) % menu_l).animate({
                left: -menu_w
            }, 0);

            $($(`.item_box${j}`).children(`.item${j}`)).animate({
                left: `+=${menu_w}`
            }, 200);

            bangArray[j] -= 1;
        });

        let interval;
console.log("222222222222222222222222")
        function slide() {
            interval = setInterval(function () {
                $(`.btn`).css({pointerEvents: `none`});

                setTimeout(function () {
                    $(`.btn`).css({pointerEvents: `auto`});
                }, 1000);

                $(`.btnR`).trigger(`click`);
            }, 2000);
        }

        slide();

        $($(`.item_box${j}`).children(`.item${j}`)).hover(function () {
            clearInterval(interval);
        }, function () {
            slide();
        });
    }









    // // 메인
    // let main_bw = $($(`.move_menu`)).outerWidth() + 15;
    // let menu_bl = $(".main_banner").children(`.move_menu`).length;
    //
    // console.log(menu_bl);
    //
    // for (let i = 0; i < menu_bl; i++) {
    //     $($(`.move_menu`)).eq(i).css({left: main_bw * i});
    // }
    //
    // let bbang = 0;
    // console.log();
    // $(`.right99`).click(function () {
    //     $(`.aside_btn`).css({
    //         pointerEvents: `none`
    //     });
    //
    //     setTimeout(function () {
    //         $(`.aside_btn`).css({pointerEvents: `auto`});
    //     }, 200);
    //
    //     $($(`.move_menu`)).animate({
    //         left: `-=${main_bw}`
    //     }, 200);
    //
    //     $($(`.move_menu`)).eq(bbang % menu_bl).animate({
    //         left: main_bw * (menu_bl - 1)
    //     }, 0);
    //
    //     bbang += 1;
    // });
    //
    // $(`.left99`).click(function () {
    //     $(`.aside_btn`).css({pointerEvents: `none`});
    //
    //     setTimeout(function () {
    //         $(`.aside_btn`).css({pointerEvents: `auto`});
    //     }, 200);
    //
    //     $($(`.move_menu`)).eq((bbang - 1) % menu_bl).animate({
    //         left: -main_bw
    //     }, 0);
    //
    //     $($(`.move_menu`)).animate({
    //         left: `+=${main_bw}`
    //     }, 200);
    //
    //     bbang -= 1;
    // });
    //
    // let mainInterval;
    //
    // function mainSlide() {
    //     mainInterval = setInterval(function () {
    //         $(`.btn`).css({pointerEvents: `none`});
    //
    //         setTimeout(function () {
    //             $(`.btn`).css({pointerEvents: `auto`});
    //         }, 1000);
    //
    //         $(`.btnR`).trigger(`click`);
    //     }, 2000);
    // }
    // mainSlide();
    //
    // $($(`.move_menu`)).hover(function () {
    //     clearInterval(mainInterval);
    // }, function () {
    //     mainSlide();
    // });
    //
    // $(window).resize(function () {
    //     // 리사이즈 시 필요한 코드 추가
    // });
});
