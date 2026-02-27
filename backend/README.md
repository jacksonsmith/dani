# API Mockada - IPTU Dojo

Backend Node.js com Express para validar o valor anual do IPTU.

## Como rodar

```bash
cd backend
npm install
npm start
```

A API estará em `http://localhost:3000`.

## Endpoint

### POST /api/validate-iptu

Valida se o valor está dentro do limite para reembolso (R$ 5.000).

**Request:**
```json
{
  "value": 3500
}
```

**Response (válido):**
```json
{
  "valid": true,
  "value": 3500,
  "message": "R$ 3500.00 - Dentro do limite para reembolso!"
}
```

**Response (inválido):**
```json
{
  "valid": false,
  "value": 6000,
  "message": "Valor acima do limite de R$ 5.000 para reembolso."
}
```
