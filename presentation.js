(() => {
  const params = new URLSearchParams(window.location.search);

  const scrollConfig = {
    behavior: "smooth",
    block: "center"
  }

  if (params.get("presentation") === "true") {
    
    window.onload = () => document.getElementsByClassName('content')[0].classList.add('presentation')

    let index = 0;

    document.addEventListener("keydown", e => {
      if (e.target.tagName === "INPUT" || e.target.tagName === "TEXTAREA") return;

      if (e.key === "ArrowRight" && document.images[index + 1] !== undefined) {
        index = index + 1
        document.images[index].scrollIntoView(scrollConfig);
      }
      if (e.key === "ArrowLeft" && index > 0 ) {
        index = index - 1
        document.images[index].scrollIntoView(scrollConfig);
      }

    });
  }
})();
