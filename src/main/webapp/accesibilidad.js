(function() {
    const savedMode = localStorage.getItem('accessibility-mode');
    if (savedMode) {
        document.documentElement.classList.add(savedMode);
    }
    const savedScale = localStorage.getItem('accessibility-font-scale');
    if (savedScale) {
        document.documentElement.style.setProperty('--global-font-scale', savedScale + 'rem');
    }
    
    window.addEventListener('DOMContentLoaded', () => {
        const line = document.createElement('div');
        line.id = 'reading-guide-line';
        document.body.appendChild(line);
        
        window.addEventListener('mousemove', (e) => {
            if(document.documentElement.classList.contains('mode-reading-line')) {
                line.style.top = e.clientY + 'px';
            }
        });
    });
})();

function cambiarTamanoLetra(accion) {
    let currentScale = parseFloat(window.getComputedStyle(document.documentElement).getPropertyValue('--global-font-scale')) || 1.0;
    if (accion === 'increase' && currentScale < 1.4) currentScale += 0.1;
    else if (accion === 'decrease' && currentScale > 0.8) currentScale -= 0.1;
    
    document.documentElement.style.setProperty('--global-font-scale', `${currentScale}rem`);
    localStorage.setItem('accessibility-font-scale', currentScale);
}

function activarModoDiscapacidad(claseModo) {
    const html = document.documentElement;
    
    const clasesAQuitar = ['mode-deuteranopia', 'mode-protanopia', 'mode-tritanopia', 'mode-dyslexia', 'mode-big-cursor', 'mode-reading-line'];
    
    if (html.classList.contains(claseModo)) {
        html.classList.remove(claseModo);
        localStorage.removeItem('accessibility-mode');
    } else {
        clasesAQuitar.forEach(c => html.classList.remove(c));
        html.classList.add(claseModo);
        localStorage.setItem('accessibility-mode', claseModo);
    }
    
    actualizarEstadosBotonesMenu();
}

function actualizarEstadosBotonesMenu() {
    const html = document.documentElement;
    const select = document.getElementById('select-discapacidad');
    if (!select) return;
    
    select.value = "";
    const clasesModos = ['mode-deuteranopia', 'mode-protanopia', 'mode-tritanopia', 'mode-dyslexia', 'mode-big-cursor', 'mode-reading-line'];
    
    clasesModos.forEach(c => {
        if (html.classList.contains(c)) {
            select.value = c;
        }
    });
}

function restaurarAccesibilidad() {
    const html = document.documentElement;
    const clasesModos = ['mode-deuteranopia', 'mode-protanopia', 'mode-tritanopia', 'mode-dyslexia', 'mode-big-cursor', 'mode-reading-line'];
    
    clasesModos.forEach(c => html.classList.remove(c));
    html.style.removeProperty('--global-font-scale');
    
    localStorage.removeItem('accessibility-mode');
    localStorage.removeItem('accessibility-font-scale');
    
    const select = document.getElementById('select-discapacidad');
    if (select) select.value = "";
}