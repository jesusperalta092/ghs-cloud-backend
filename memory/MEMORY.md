# MEMORY.md — Hechos Persistentes

> Este archivo acumula hechos que el agente debe recordar entre sesiones.
> Formato: cada hecho es una entrada con fecha y categoría.

## Proyecto GHS-Script-Free (activo)

- **Ubicación**: `C:\Users\USER\Downloads\GHS-Script-Free`
- **Arquitectura**: Puente WebSocket (`bridge.py` en :17613) + MCP server (`hermes_mcp_server.py`) + extensión de navegador MV3 (`zeroscript-extension/`)
- **Skills**: Viven en `C:\Users\USER\AppData\Local\hermes\skills\` (NO en el repo)
- **Extensión**: Inyecta comandos JSON en chats web (DeepSeek, ChatGPT, Gemini, Kimi) y los ejecuta en la PC
- **OpenAI-compat server**: `adapters/openai_server.py` en :17614
- **Puertos**: 17613 (bridge WS), 17614 (OpenAI compat), 9876 (Blender)
- **Backup pre-cambios**: `_backup_YYYYMMDD_HHMMSS/` en la raíz del proyecto

## Skills Críticas del Sistema

### Diseño (chain: prompt-builder-master)
- `prompt-builder-master` (orquestador, 40 triggers, pipeline 3 fases)
- `impeccable-design` (8pt grid, WCAG AAA, glassmorphism)
- `taste-skill` (anti-slop, criterio estético)
- `popular-web-designs` (Stripe, Linear, Vercel como referencia)
- `emil-motion` (física de animaciones, spring, <300ms)
- `claude-design` (artefactos HTML one-off)
- `design-md` (design tokens exportables)

### Scraping
- `hermes_prospect_scrape` (OSM multi-mirror + Bing + DDG)
- `hermes_stealth_scrape` (Playwright + Chrome real, bypass Cloudflare)

### Utilidades
- `hermes_terminal` (CMD/PowerShell/Python)
- `hermes_file_read/write/patch`
- `hermes_execute_code` (Python interactivo en la PC)
- `hermes_computer_use` (desktop automation)
- `hermes_project_clean` (aislamiento y limpieza de proyectos)

## Memoria del Sistema (3 capas)

- **CAPA 1** (este archivo): `SOUL.md` + `USER.md` + `MEMORY.md` en `C:\Users\USER\AppData\Local\hermes\memory\` — inyectados en CADA prompt
- **CAPA 2**: SQLite `memories` en `%LOCALAPPDATA%\hermes\zeroscript_memory.db` — búsqueda por clave/categoría
- **CAPA 3**: AgentBrain JSON en `~/Downloads/agent_workspace/agent_brain.json` — lecciones, playbooks, procedimientos

## Bugs Conocidos

- Si `agent_brain.json` no existe en `~/Downloads/agent_workspace/`, se crea vacío al inicio.
- El toggle "Memoria Persistente" del dashboard activa SQLite `memories` pero NO toca AgentBrain ni MEMORY.md (pendiente FASE C).
- `config.js` usa `${BT}` como placeholder del backtick (definido como `const BT = "\`\`\`"`). NUNCA meter backticks literales o rompe el template literal.

## Reglas Críticas del Usuario

- **Proyectos aislados**: cada tarea nueva = carpeta nueva en Downloads
- **Cero reciclaje**: NUNCA leer/reutilizar carpetas de proyectos anteriores
- **Limpieza obligatoria**: al terminar, `hermes_project_clean clean`
- **Backup antes de tocar**: `hermes_mcp_server.py` y `config.js` tienen backup en `_backup_*`

## Historial de Sesiones

- **2026-10-30**: Integración de skills de diseño (prompt-builder-master creado, 6 skills con triggers, auto-carga en config.js blindada contra negativa del modelo). Funcionando end-to-end en DeepSeek web.
- **2026-10-30**: Sistema de memoria 3 capas — SOUL.md + USER.md + MEMORY.md creados en `%LOCALAPPDATA%\hermes\memory\`.


## Reglas de Arquitectura (Full-Stack)

- **REGLA FULL-STACK**: Para plataformas, juegos o apps con estado, el agente DEBE usar React/Vite o Next.js. PROHIBIDO generar un solo archivo HTML monolítico.
- **Skill obligatoria**: `fullstack-app-builder`.
- **Estado**: Usar Zustand o Context API para manejar niveles y progreso.
- **Componentes**: Separar UI de lógica. Un archivo por componente.
