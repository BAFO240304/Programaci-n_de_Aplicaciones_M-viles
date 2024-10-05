    // Función para alternar el menú lateral
    function toggleMenu() {
        var sideMenu = document.getElementById('sideMenu');
        var mainContent = document.getElementById('mainContent');
        
        sideMenu.classList.toggle('open');
        mainContent.classList.toggle('shifted');
    }