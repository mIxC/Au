// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
    function isWinner (){
        var result = [
            ["x", "o", "o"],
            ["x", "x", "x"],
            ["o", "x", "o"]
        ];

        function rowTest(index) {
            var winner = '';
            var prevSymbol = '';
            result[index].some(function(el, idx){
                if(prevSymbol && prevSymbol != el){
                    return true;
                } else if(prevSymbol == el && idx == 2){
                    winner = el;
                }
                prevSymbol = el;
            });
        }
        function columnTest(index) {
            //проверка того, что кто-либо выиграл в указанном столбце
        }

        var testResult = rowTest(1);

        if(testResult == "x") {
            console.log("выиграл x");
        } else if(testResult == "o") {
            console.log("выиграл o");
        } else {
            console.log("никто не выиграл");
        }
    }
    //==========================================================
    var clickCount =0;
    $(document).ready(function() {
        var lastSymbol = "o";
        $('.xo .col-xs-4').click(function() {
            if($(this).html() == "x" || $(this).html() == "o")
                return;

            clickCount++;

            var curSymbol = "";

            if(lastSymbol == "o"){
                curSymbol = 'x';
            }else{
                curSymbol = 'o';
            }

            lastSymbol = curSymbol;

            $(this).html(curSymbol);
            $.post('/steps/', {room_id: $('input[name=room_id]').val(), symbol: curSymbol}).then(function(result){
                console.log(result);
            });
            if(clickCount==7){
                alert("Вы выиграли");
                $('.center-block.btn.btn-success.navbar-btn.btn-lg').show();
            }
        })
    })
});