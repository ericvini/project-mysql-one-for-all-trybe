CREATE VIEW faturamento_atual AS
(SELECT MIN(PaymentPlanPrice)  AS 'faturamento_minimo', 
MAX(PaymentPlanPrice) AS 'faturamento_maximo',
ROUND(AVG(PaymentPlanPrice),2) AS 'faturamento_medio',
ROUND(SUM(PaymentPlanPrice),2) AS 'faturamento_total'
FROM  SpotifyClone.paymentplans AS P
INNER JOIN SpotifyClone.users AS U ON U.PaymentPlanID = P.PaymentPlanID
);
