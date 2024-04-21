document.addEventListener("turbo:load", function() {
    // Przy załadowaniu strony sprawdź, czy dla bieżącego URL-a mamy zapisaną pozycję przewijania.
    const savedScroll = localStorage.getItem(window.location.href);
    if (!savedScroll) { return; }
  
    const scrollPosition = JSON.parse(savedScroll);
  
    if (scrollPosition && scrollPosition < document.documentElement.scrollHeight) {
      window.scrollTo(0, scrollPosition);
    }
  
    // Usuń zapisaną pozycję, aby nie wpłynęła na inne nawigacje.
    localStorage.removeItem(window.location.href);
  });
  
  document.addEventListener("turbo:before-visit", function() {
    // Zapisz bieżącą pozycję przewijania przed opuszczeniem strony.
    localStorage.setItem(window.location.href, window.scrollY || document.documentElement.scrollTop);
  });
  