import express from 'express';
import cors from 'cors';

const app = express();
const PORT = 3000;
const MAX_REIMBURSEMENT_LIMIT = 5000;

app.use(cors());
app.use(express.json());

/**
 * POST /api/validate-iptu
 * Body: { "value": number }
 * Valida se o valor anual do IPTU está dentro do limite para reembolso (R$ 5.000)
 */
app.post('/api/validate-iptu', (req, res) => {
  const { value } = req.body;

  if (value == null || typeof value !== 'number') {
    return res.status(400).json({
      valid: false,
      message: 'Informe um valor válido.',
    });
  }

  if (value <= 0) {
    return res.status(400).json({
      valid: false,
      message: 'O valor deve ser maior que zero.',
    });
  }

  if (value <= MAX_REIMBURSEMENT_LIMIT) {
    return res.json({
      valid: true,
      value,
      message: `R$ ${value.toFixed(2)} - Dentro do limite para reembolso!`,
    });
  }

  return res.json({
    valid: false,
    value,
    message: `Valor acima do limite de R$ ${MAX_REIMBURSEMENT_LIMIT.toLocaleString('pt-BR')} para reembolso.`,
  });
});

app.listen(PORT, () => {
  console.log(`🚀 API rodando em http://localhost:${PORT}`);
  console.log(`   POST /api/validate-iptu - Body: { "value": number }`);
});
