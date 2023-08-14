// function sendToFlutterWeb(arg) {
//     window.state = {
//         arg0: arg,
//     }
//     alert(arg)
// }
function sendToFlutterWeb(arg0, arg1, arg2) {
    window.state = {
        arg0: arg0,
        arg1: arg1,
        arg2: arg2
    }
    alert(arg0 + arg1 + arg2)
}
