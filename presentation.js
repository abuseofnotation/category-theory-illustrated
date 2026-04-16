// A small JS lib that turns a website into a 
// presentation.

(() => {

  // List of elements which we want to focus on for
  // our presentation (all other elements would be 
  // ignored.
  const elementsToFocus = "img, h1, h2, h3, h4, h5, h6, .definition, .theorem, table, pre, mjx-mtable, mjx-frac"

  // Set scrolling behavior
  const scrollConfig = {
    behavior: "smooth",
    block: "center"
  }


  const params = new URLSearchParams(window.location.search);
  if (params.get("presentation") === "true") {
    
    // A list of all elements that we want to present
    let elements = []

    // The index of the current element that we are viewing
    let index = 0;

    window.onload = () => {
      //setTimeout(() => {
        // Add a CSS style to the page
        document.getElementsByClassName('content')[0].classList.add('presentation')

        // Amend links, so they preserve the url params
        Array.from(document.getElementsByTagName('a'))
          .forEach(a => {a.href = a.href + document.location.search})

        elements = document.querySelectorAll(elementsToFocus)
        next()
      //}, 2000)
    }

    const next = () => {
      if (elements[index + 1] !== undefined) {
        index = index + 1
        elements[index].scrollIntoView(scrollConfig);
      } else {
        // If we reached the end of the presentable elements, go to the next page
        document.getElementsByClassName('prev-next')[0].children[1].click()
      }
    }

    // UI controls for next and previous element
    const prev = () => {
      if (index > 0) {
        index = index - 1
        elements[index].scrollIntoView(scrollConfig);
      } else {
        // document.getElementsByClassName('prev-next')[0].children[0].click()
      }
    }
    document.getElementById('next').onclick = next
    document.getElementById('prev').onclick = prev
    document.getElementById('next').style.display = "none"
    document.getElementById('prev').style.display = "none"

    // Enable scrolling through the presentation
    // with keyboard left and right arrows
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
