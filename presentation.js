(() => {
  const params = new URLSearchParams(window.location.search);
  const scrollConfig = {
    behavior: "smooth",
    block: "center"
  }


  if (params.get("presentation") === "true") {
    
    window.onload = () => {

      // Add a CSS style to the page
      document.getElementsByClassName('content')[0].classList.add('presentation')

      // Amend links, so they preserve the url params
      Array.from(document.getElementsByTagName('a'))
        .forEach(a => {a.href = a.href + document.location.search})
    }

    // Controlls for next and previous page
    let index = 0;

    const next = () => {
      if (document.images[index + 1] !== undefined) {
        index = index + 1
        document.images[index].scrollIntoView(scrollConfig);
      }
    }

    const prev = () => {
      if (index > 0) {
        index = index - 1
        document.images[index].scrollIntoView(scrollConfig);
      }
    }

    //Make the buttons work
    document.getElementById('next').onclick = next
    document.getElementById('prev').onclick = prev

    //Enable scrolling with left and right
    document.addEventListener("keydown", e => {
      if (e.target.tagName !== "INPUT" && e.target.tagName !== "TEXTAREA") {
        if (e.key === "ArrowRight" ) {
          next()
        } else if (e.key === "ArrowLeft" ) {
          prev()
        }
      }
    });
  }
})();
