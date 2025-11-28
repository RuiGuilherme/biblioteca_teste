CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE Livros (
    idLivro INT AUTO_INCREMENT PRIMARY KEY,
    titulo TEXT NOT NULL,
    isbn TEXT NOT NULL,
    dtCriacao DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Exemplares (
    idExemplar INT AUTO_INCREMENT PRIMARY KEY,
    idLivro INT NOT NULL,
    status ENUM('disponível', 'emprestado') NOT NULL,
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro)
);

CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome TEXT NOT NULL,
    dataNascimento DATE NOT NULL,
    telefone TEXT,
    email TEXT,
    dtCadastro DATE DEFAULT (CURRENT_DATE),
    tipoUsuario ENUM('leitor', 'funcionario', 'admin') NOT NULL
);

CREATE TABLE Emprestimo (
    idEmprestimo INT AUTO_INCREMENT PRIMARY KEY,
    idExemplar INT NOT NULL,
    idUsuario INT NOT NULL,
    dataEmprestimo DATE NOT NULL,
    dataPrevistaDevolucao DATE NOT NULL,
    dataDevolucao DATE,
    FOREIGN KEY (idExemplar) REFERENCES Exemplares(idExemplar),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);
