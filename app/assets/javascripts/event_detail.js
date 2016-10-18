/**
 * Created by Rafa on 10/13/2016.
 */
function setCountDown(end_time,message) {
    function fill(str) {
        return (("" + str).length == 1) ? "0" + str : str;
    };
    var start = Date.now();
    var end = Date.parse(end_time);

    var dif = end - start;
    if(dif > 0) {
        var seconds;
        var minutes;
        var hours;
        var days;

        setInterval(function () {
            dif = dif - 1000;

            seconds = Math.floor(dif / 1000);

            minutes = Math.floor(seconds / 60);
            seconds = seconds % 60;

            hours = Math.floor(minutes / 60);
            minutes = minutes % 60;

            days = Math.floor(hours / 24);
            hours = hours % 24;

            var str = (days != 0) ? days + ":" : '';
            str = str + fill(hours) + ":" + fill(minutes) + ":" + fill(seconds);

            $(".countdown").html(str);
        }, 1000);
    }else
        $(".countdown").html(message);
};