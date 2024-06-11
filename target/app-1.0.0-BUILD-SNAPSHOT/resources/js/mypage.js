$(document).ready(function(){
    let i=1
    $('.leftbox').hover(function(){
        $(this).css({
            background: `black`,
            color :`white`
            
            
        })
    }, function(){
        $(this).css({
            background: 'rgb(207, 207, 207)',
            color :`black`
        })
    })
    $('.leftbox1').click(function(){
        $(`.rightbox1`).css({
            opacity: 0.5
            
        })
    })
    $('.leftbox2').click(function(){
        $(`.rightbox2`).css({
            opacity: 0.7
        })
    })
    $('.circle').click(function(){
        alert(111)
        $(`.rightbox2`).css({
            opacity: 1
        })
    })


})