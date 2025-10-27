-- =====================================
-- Schema do Projeto A3 - PostgreSQL
-- =====================================
CREATE DATABASE projetoa3;

\c projetoa3
-- 1. Tabela de Bancos
CREATE TABLE bancos (
    id_banco SERIAL PRIMARY KEY, -- id padrão de cada banco 
    nome_banco VARCHAR(100) NOT NULL, -- nome do banco 
    cnpj VARCHAR(20), -- cnpj banco
    site_oficial VARCHAR(200), -- Site mais utilizado/official do banco
    descricao TEXT, -- possiveis informações adicionais do  banco.
    data_cadastro TIMESTAMP DEFAULT NOW() -- data do registro do banco 
);

-- 2. Tabela de Contatos Oficiais
CREATE TABLE contatos_oficiais (
    id_contato SERIAL PRIMARY KEY, -- id do contato
    id_banco INT NOT NULL REFERENCES bancos(id_banco) ON DELETE CASCADE, -- id do banco referenciado da tabela Bancos
    tipo_contato VARCHAR(50) NOT NULL, -- telefone, email, site
    valor_contato VARCHAR(150) NOT NULL,-- o conteudo do contato
    observacao TEXT,-- campo para informações adicionais
    verificado BOOLEAN DEFAULT TRUE, -- validação se o contato é realmente official
    data_validacao TIMESTAMP DEFAULT NOW() -- data que o contato foi validado
);

-- 3. Tabela de Tipos de Golpes
CREATE TABLE tipos_golpe (
    id_tipo SERIAL PRIMARY KEY, -- id especifico para cada golpe 
    nome_tipo VARCHAR(100) NOT NULL, -- Nome do golpe ex: "Falsa central de atendimento"
    descricao TEXT -- descrição do golpe
);

-- 4. Tabela de Denúncias
CREATE TABLE denuncias (
    id_denuncia SERIAL PRIMARY KEY, -- id da denuncia 
    id_tipo INT REFERENCES tipos_golpe(id_tipo), -- ID do tipo do golpe, referenciado da tabela de tipos de golpe
    id_banco INT REFERENCES bancos(id_banco), -- ID do banco que o golpista se passou
    contato_denunciado VARCHAR(150) NOT NULL, -- número, email, site
    descricao TEXT, -- descrição do golpe em si
    data_denuncia TIMESTAMP DEFAULT NOW(), -- data que foi denunciada 

);

-- 5. Tabela de Consultas
CREATE TABLE consultas (
    id_consulta SERIAL PRIMARY KEY, -- id da consulta
    termo_pesquisado VARCHAR(150) NOT NULL, --email/numero/site pesquisado
    resultado_encontrado VARCHAR(50), -- oficial, suspeito, inexistente
    data_consulta TIMESTAMP DEFAULT NOW(), -- data da consulta realizada

);

