USE Biblioteca;

-- ===========================
-- TESTE 1: Listar todos os livros ordenados por título
-- ===========================
SELECT idLivro, titulo, isbn FROM Livros ORDER BY titulo ASC;

-- ===========================
-- TESTE 2: Listar os 5 primeiros usuários cadastrados
-- ===========================
SELECT idUsuario, nome, tipoUsuario FROM Usuario ORDER BY dtCadastro ASC LIMIT 5;

-- ===========================
-- TESTE 3: Listar exemplares disponíveis
-- ===========================
SELECT idExemplar, idLivro, status FROM Exemplares WHERE status = 'disponível' ORDER BY idLivro;

-- ===========================
-- TESTE 4: Listar exemplares disponíveis e o nome do titulo
-- ===========================
SELECT e.idExemplar, e.idLivro, l.titulo, e.status
FROM Exemplares AS e
JOIN Livros AS l ON l.idLivro = e.idLivro
WHERE e.status = 'disponível'
ORDER BY e.idLivro;

-- ===========================
-- TESTE 5: Listar exemplares não disponíveis e o nome do titulo
-- ===========================

-- Primeiro vamos emprestar eles, execute essas duas linhas
INSERT INTO Emprestimo (idExemplar, idUsuario, dataEmprestimo, dataPrevistaDevolucao, dataDevolucao) VALUES
(3, 5, '2025-01-12', '2025-01-22', NULL),
(5, 7, '2025-01-14', '2025-01-24', NULL),
(7, 9, '2025-01-16', '2025-01-26', NULL),
(9, 11, '2025-01-18', '2025-01-28', NULL);

UPDATE Exemplares SET status = 'emprestado' WHERE idExemplar IN (3,5,7,9);
-- Continue adicionando até 50 registros conforme necessidade

SELECT e.idExemplar, e.idLivro, l.titulo, e.status
FROM Exemplares AS e
JOIN Livros AS l ON l.idLivro = e.idLivro
WHERE e.status = 'emprestado';

-- ===========================
-- TESTE 6: Listar empréstimos ativos com nome do usuário e título do livro
-- ===========================
SELECT e.idEmprestimo, u.nome AS Usuario, l.titulo AS Livro, e.dataEmprestimo
FROM Emprestimo e
JOIN Usuario u ON e.idUsuario = u.idUsuario
JOIN Exemplares ex ON e.idExemplar = ex.idExemplar
JOIN Livros l ON ex.idLivro = l.idLivro
WHERE e.dataDevolucao IS NULL
ORDER BY e.dataEmprestimo DESC;

-- ===========================
-- TESTE 7: Histórico de empréstimos por usuário (com devolução)
-- ===========================
SELECT u.nome, l.titulo, e.dataEmprestimo, e.dataDevolucao
FROM Emprestimo e
JOIN Usuario u ON e.idUsuario = u.idUsuario
JOIN Exemplares ex ON e.idExemplar = ex.idExemplar
JOIN Livros l ON ex.idLivro = l.idLivro
WHERE e.dataDevolucao IS NOT NULL
ORDER BY u.nome, e.dataEmprestimo;
