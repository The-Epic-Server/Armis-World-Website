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

function copytexttooltip(text, element) {
	var attribute = element.getAttribute("data-bs-original-title");
	element.style.display = "none";
	copytext(text);
	element.setAttribute("data-bs-original-title", "Copied!");
	setTimeout(() => {
		element.style.display = "inline";
	}, 1);
	setTimeout(() => {
		element.setAttribute("data-bs-original-title", attribute);
		element.style.display = "none";
		setTimeout(() => {
			element.style.display = "inline";
		}, 1);
	}, 3000);
}