let x = false;

function imageChange(obj, imgX, imgY) {
    if  (x){
        obj.src=imgX
    } else {
        obj.src=imgY
    }
    x=!x
}
