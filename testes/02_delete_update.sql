
USE Biblioteca;

-- ===========================
-- TESTE 1: Atualizar status de um exemplar
-- ===========================
SELECT * FROM Exemplares WHERE idExemplar = 3;

UPDATE Exemplares SET status = 'disponivel' WHERE idExemplar = 3;

SELECT * FROM Exemplares WHERE idExemplar = 3;

-- ===========================
-- TESTE 2: Atualizar email de um usuário
-- ===========================
SELECT idUsuario, nome, email FROM Usuario WHERE idUsuario = 10;

UPDATE Usuario SET email = 'novoemail@biblioteca.com' WHERE idUsuario = 10;

SELECT idUsuario, nome, email FROM Usuario WHERE idUsuario = 10;

-- ===========================
-- TESTE 3: Marcar empréstimo como devolvido
-- ===========================
INSERT INTO Emprestimo (idExemplar, idUsuario, dataEmprestimo, dataPrevistaDevolucao, dataDevolucao) VALUES
(5, 7, '2025-01-14', '2025-01-24', NULL);

SELECT * FROM Emprestimo WHERE idEmprestimo = LAST_INSERT_ID();

UPDATE Emprestimo SET dataDevolucao = CURDATE() WHERE idEmprestimo = LAST_INSERT_ID();

SELECT * FROM Emprestimo WHERE idEmprestimo = LAST_INSERT_ID();

-- ===========================
-- TESTE 4: Remover empréstimo devolvido
-- ===========================
SELECT * FROM Emprestimo WHERE idEmprestimo = LAST_INSERT_ID();

DELETE FROM Emprestimo WHERE idEmprestimo = LAST_INSERT_ID() AND dataDevolucao IS NOT NULL;

SELECT * FROM Emprestimo WHERE idEmprestimo = LAST_INSERT_ID();

-- ===========================
-- TESTE 5: Remover exemplar 
-- ===========================
INSERT INTO Exemplares (idLivro, status) VALUES
(1, 'disponível');

SELECT * FROM Exemplares WHERE idExemplar = LAST_INSERT_ID();

DELETE FROM Exemplares WHERE idExemplar = LAST_INSERT_ID();

SELECT * FROM Exemplares WHERE idExemplar = LAST_INSERT_ID();
