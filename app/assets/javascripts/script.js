window.onload = function() {
    let photoInput = document.getElementById("photo-input")
    let checkBox = document.getElementById("gifCheck")
    console.log(checkBox)
    let clickHappened = function() {
        if (checkBox.checked) {
            photoInput.style.backgroundColor = "#e0e0e0";
            photoInput.readOnly = true
            photoInput.value="##########"
        }else{
            photoInput.style.backgroundColor = "white";
            photoInput.readOnly = false
            photoInput.value=""
        }
    }

    checkBox.addEventListener("click", clickHappened);

}