function copytext(text) {
	var copyText = document.createElement("textarea");
	copyText.value = text;
    document.body.appendChild(copyText);
	copyText.style.display = "block";
	copyText.select();
	copyText.setSelectionRange(0, 99999)
	document.execCommand("copy");
	copyText.remove();
}