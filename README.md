# GOB DATA 360 - Plataforma Educativa

Plataforma educativa moderna para capacitación virtual en herramientas digitales públicas para estudiantes de Gestión Pública y Desarrollo Social.

## Características Principales

- 🔐 Autenticación segura (inicio de sesión y registro)
- 📚 Módulos de aprendizaje interactivos
- 🎥 Clases en vivo con integración de Google Meet
- 📁 Gestión de recursos (PDF, videos, documentos)
- 💬 Sistema de comentarios y discusiones
- 📊 Evaluaciones via Google Forms
- 📈 Seguimiento de progreso del estudiante
- 📋 Encuestas de satisfacción
- 🔔 Notificaciones automáticas
- 🎨 Modo claro/oscuro
- 📱 Diseño 100% responsive
- 📊 Panel de análisis para docentes

## Stack Tecnológico

### Backend
- Node.js con Express.js
- SQLite3 (base de datos sin servidor)
- JWT para autenticación
- Multer para upload de archivos

### Frontend
- HTML5, CSS3, JavaScript ES6+
- Inter font family
- Font Awesome para íconos
- Diseño responsive

## Requisitos Previos

- Node.js (versión 16 o superior)
- npm (viene incluido con Node.js)

## Instalación Rápida

### 1. Clonar o descargar el proyecto

### 2. Instalar dependencias del backend

```bash
cd backend
npm install
```

En Windows PowerShell, si la política de ejecución bloquea `npm`, usa:

```powershell
cd backend
npm.cmd install
```

### 3. Inicializar la base de datos con datos de prueba

```bash
npm run seed
```

### 4. Iniciar el servidor

```bash
npm start
```

En Windows PowerShell:

```powershell
npm.cmd start
```

O para desarrollo con recarga automática:

```bash
npm run dev
```

### 5. Abrir la aplicación

Abre tu navegador y visita: `http://localhost:3000`

## Inicio rápido en Windows

- Puedes usar `INICIAR.bat` para preparar dependencias y abrir la app sin modificar la estructura del proyecto.
- También puedes usar `instalar.ps1`; el script ya quedó ajustado para invocar `npm.cmd` y evitar bloqueos típicos de PowerShell.

## Estructura del Proyecto

```
GOB DATA UNAJ/
├── backend/
│   ├── config/
│   │   ├── database.js       # Configuración de la base de datos
│   │   └── seed.js           # Datos de prueba iniciales
│   ├── controllers/          # Controladores de la API
│   ├── middleware/           # Middleware (autenticación)
│   ├── models/               # Modelos de datos
│   ├── routes/               # Rutas de la API
│   ├── public/
│   │   └── uploads/          # Archivos subidos por usuarios
│   ├── package.json
│   └── server.js             # Servidor principal
├── frontend/
│   ├── css/
│   │   └── styles.css        # Estilos de la aplicación
│   ├── js/
│   │   └── app.js            # Lógica del frontend
│   ├── assets/
│   │   ├── images/
│   │   └── icons/
│   └── index.html            # Página principal
└── README.md
```

## Funcionalidades por Rol

### Docente
- ✅ Gestionar módulos (crear, editar, eliminar)
- ✅ Subir recursos (PDF, documentos, videos)
- ✅ Programar clases en vivo
- ✅ Crear y gestionar evaluaciones
- ✅ Ver estadísticas y análisis de estudiantes
- ✅ Gestionar comentarios

### Estudiante
- ✅ Acceder a módulos y recursos
- ✅ Ver y unirse a clases en vivo
- ✅ Realizar evaluaciones
- ✅ Hacer comentarios
- ✅ Ver su progreso
- ✅ Completar encuestas de satisfacción
- ✅ Recibir notificaciones
- ✅ Solicitar certificado al completar

## API REST - Endpoints Principales

### Autenticación
- `POST /api/auth/register` - Registrar usuario
- `POST /api/auth/login` - Iniciar sesión
- `GET /api/auth/me` - Obtener usuario actual

### Módulos
- `GET /api/modules` - Obtener todos los módulos
- `GET /api/modules/:id` - Obtener módulo por ID
- `POST /api/modules` - Crear módulo (docente)
- `PUT /api/modules/:id` - Actualizar módulo (docente)
- `DELETE /api/modules/:id` - Eliminar módulo (docente)

### Recursos
- `GET /api/resources/module/:moduleId` - Obtener recursos de un módulo
- `POST /api/resources` - Subir recurso (docente)
- `DELETE /api/resources/:id` - Eliminar recurso (docente)

### Clases en Vivo
- `GET /api/live-classes` - Obtener todas las clases
- `POST /api/live-classes` - Crear clase (docente)
- `PUT /api/live-classes/:id` - Actualizar clase (docente)
- `DELETE /api/live-classes/:id` - Eliminar clase (docente)

### Comentarios
- `GET /api/comments/module/:moduleId` - Obtener comentarios de un módulo
- `POST /api/comments` - Crear comentario
- `DELETE /api/comments/:id` - Eliminar comentario

### Evaluaciones
- `GET /api/evaluations/module/:moduleId` - Obtener evaluaciones
- `POST /api/evaluations` - Crear evaluación (docente)
- `PUT /api/evaluations/:id` - Actualizar evaluación (docente)
- `DELETE /api/evaluations/:id` - Eliminar evaluación (docente)

### Encuestas
- `GET /api/surveys/module/:moduleId` - Obtener encuestas
- `POST /api/surveys` - Enviar encuesta
- `GET /api/surveys/module/:moduleId/stats` - Estadísticas de encuestas (docente)

### Notificaciones
- `GET /api/notifications` - Obtener notificaciones del usuario
- `GET /api/notifications/unread` - Contar notificaciones no leídas
- `PUT /api/notifications/:id/read` - Marcar como leída

### Progreso
- `GET /api/progress` - Obtener progreso del usuario
- `PUT /api/progress` - Actualizar progreso

### Estadísticas
- `GET /api/analytics` - Obtener estadísticas (docente)

## Seguridad

- 🔒 Contraseñas encriptadas con bcrypt
- 🔐 Autenticación JWT
- 🛡️ Control de acceso por roles
- 📁 Upload de archivos con validación de tamaño y tipo

## Personalización

### Variables de Entorno
Crea un archivo `.env` en la carpeta `backend` (basado en `.env.example`):

```
PORT=3000
SESSION_SECRET=tu_clave_secreta_aqui
JWT_SECRET=tu_jwt_secreto_aqui
MAX_FILE_SIZE=104857600
DB_PATH=./gobdata360.db
UPLOAD_DIR=./public/uploads
```

## Despliegue en Producción

1. Configura las variables de entorno con valores seguros
2. Si el hosting ejecuta el proyecto desde la raiz del repositorio, usa el `package.json` raiz agregado para instalar y arrancar automaticamente el backend
3. Si tu proveedor ofrece disco persistente, configura `DB_PATH` y `UPLOAD_DIR` para guardar la base SQLite y los archivos fuera del filesystem temporal
4. En Render puedes usar el archivo `render.yaml` incluido para desplegar con disco persistente en `/var/data`
5. Asegurate de que la ruta configurada en `UPLOAD_DIR` tenga permisos de escritura
6. Considera migrar SQLite a PostgreSQL para mayor escalabilidad y multiusuario real
7. Usa PM2 o similar para gestionar el proceso de Node.js en VPS o servidores tradicionales
8. Configura un proxy inverso (Nginx, Apache) si despliegas en tu propio servidor

### Variables recomendadas para hosting publico

```env
PORT=3000
SESSION_SECRET=un_valor_seguro
JWT_SECRET=un_valor_seguro
MAX_FILE_SIZE=104857600
DB_PATH=/var/data/gobdata360.db
UPLOAD_DIR=/var/data/uploads
```

### Nota importante sobre la version actual

La interfaz estable actual usa `localStorage` como persistencia principal del frontend. Eso significa que, aunque el proyecto ya puede publicarse mejor en un dominio y el backend queda mas preparado para hosting, los datos creados desde la interfaz no se comparten entre navegadores como en una plataforma multiusuario real hasta volver a conectar completamente el frontend con la API.

## Contribuciones

¡Contribuciones son bienvenidas! Por favor, abre un issue primero para discutir los cambios que te gustaría hacer.

## Licencia

MIT License - Ver archivo LICENSE para más detalles.

## Creado por

Jutlis Vestigios

---

¡Gracias por usar GOB DATA 360!
