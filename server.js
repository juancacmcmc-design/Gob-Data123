require('dotenv').config();
const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');
const db = require('./config/database');

const app = express();
const PORT = process.env.PORT || 3000;
const frontendDir = path.join(__dirname, '../frontend');
const uploadsDir = process.env.UPLOAD_DIR || path.join(__dirname, 'public/uploads');

fs.mkdirSync(uploadsDir, { recursive: true });

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static(uploadsDir));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/api/auth', require('./routes/authRoutes'));
app.use('/api/users', require('./routes/userRoutes'));
app.use('/api/modules', require('./routes/moduleRoutes'));
app.use('/api/resources', require('./routes/resourceRoutes'));
app.use('/api/live-classes', require('./routes/liveClassRoutes'));
app.use('/api/comments', require('./routes/commentRoutes'));
app.use('/api/evaluations', require('./routes/evaluationRoutes'));
app.use('/api/surveys', require('./routes/surveyRoutes'));
app.use('/api/notifications', require('./routes/notificationRoutes'));
app.use('/api/progress', require('./routes/progressRoutes'));
app.use('/api/analytics', require('./routes/analyticsRoutes'));

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.use(express.static(frontendDir));

app.get('*', (req, res) => {
  res.sendFile(path.join(frontendDir, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
