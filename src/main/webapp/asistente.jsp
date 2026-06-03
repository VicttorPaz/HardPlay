<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="accessibility-fab">
    <button class="btn-access-toggle" id="accessMainBtn" onclick="toggleAccessMenu()" title="Menú de Accesibilidad" aria-expanded="false">
        <i class="bi bi-universal-access"></i>
    </button>
    <div class="access-menu" id="accessMenu">
        <h4><i class="bi bi-gear-fill"></i> Asistente de Accesibilidad</h4>
        
        <p style="font-size:0.75rem; color:#8b949e; margin-bottom:8px;">Tamaño del Texto:</p>
        <div class="access-btn-group">
            <button class="btn-access-action" onclick="cambiarTamanoLetra('increase')"><i class="bi bi-zoom-in"></i> Más Grande</button>
            <button class="btn-access-action" onclick="cambiarTamanoLetra('decrease')"><i class="bi bi-zoom-out"></i> Más Chico</button>
        </div>

        <p style="font-size:0.75rem; color:#8b949e; margin-bottom:8px;">Modo de Soporte Especial:</p>
        <select id="select-discapacidad" onchange="activarModoDiscapacidad(this.value)" style="width: 100%; padding: 8px; background: #21262d; color: white; border: 1px solid #30363d; border-radius: 6px; margin-bottom: 15px; font-size: 0.85rem;">
            <option value="">-- Ninguno (Por defecto) --</option>
            <option value="mode-deuteranopia">Daltonismo: Deuteranopía</option>
            <option value="mode-protanopia">Daltonismo: Protanopía</option>
            <option value="mode-tritanopia">Daltonismo: Tritanopía</option>
            <option value="mode-dyslexia">Lectura Fácil (Dislexia)</option>
            <option value="mode-big-cursor">Puntero Grande (Visual/Motriz)</option>
            <option value="mode-reading-line">Línea de Enfoque (TDAH)</option>
        </select>
        
        <button class="btn-access-action" style="width:100%; background:#d90429;" onclick="restaurarAccesibilidad()"><i class="bi bi-arrow-counterclockwise"></i> Restaurar Todo</button>
    </div>
</div>

<script>
    window.addEventListener('DOMContentLoaded', () => {
        if (typeof actualizarEstadosBotonesMenu === 'function') {
            actualizarEstadosBotonesMenu();
        }
    });

    function toggleAccessMenu() {
        const menu = document.getElementById('accessMenu');
        const btn = document.getElementById('accessMainBtn');
        const isOpen = menu.classList.toggle('show');
        btn.setAttribute('aria-expanded', isOpen);
    }

    window.addEventListener('click', function(e){
        const menu = document.getElementById('accessMenu');
        const btn = document.getElementById('accessMainBtn');
        if (menu && !menu.contains(e.target) && !btn.contains(e.target)) {
            menu.classList.remove('show');
            btn.setAttribute('aria-expanded', 'false');
        }
    });
</script>