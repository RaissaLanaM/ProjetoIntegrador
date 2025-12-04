-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/11/2025 às 15:30
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tcc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL,
  `de_usuario_id` int(11) DEFAULT NULL,
  `para_usuario_id` int(11) DEFAULT NULL,
  `nota` int(11) DEFAULT NULL CHECK (`nota` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `data_avaliacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `de_usuario_id`, `para_usuario_id`, `nota`, `comentario`, `data_avaliacao`) VALUES
(1, 2, 1, 5, 'A Raissa foi super rápida para devolver a carteira.', '2025-11-22 09:30:00'),
(2, 2, 4, 5, 'A Carla foi muito atenciosa na devolução do celular.', '2025-11-22 10:00:00'),
(3, 3, 2, 4, 'Adriana se comunicou bem e cumpriu o combinado.', '2025-11-22 11:00:00'),
(4, 16, 2, 5, '', '2025-11-26 09:48:21'),
(5, 16, 4, 4, '', '2025-11-26 09:50:14'),
(6, 17, 2, 3, '', '2025-11-26 10:29:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `usuario1_id` int(11) NOT NULL,
  `usuario2_id` int(11) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('aberto','fechado') DEFAULT 'aberto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chats`
--

INSERT INTO `chats` (`id`, `usuario1_id`, `usuario2_id`, `criado_em`, `atualizado_em`, `status`) VALUES
(1, 2, 1, '2025-11-21 21:00:00', '2025-11-21 21:30:00', 'aberto'),
(2, 2, 4, '2025-11-21 01:10:00', '2025-11-21 01:45:00', 'aberto'),
(3, 3, 2, '2025-11-19 15:00:00', '2025-11-19 15:30:00', 'aberto'),
(6, 4, 1, '2025-11-26 04:22:14', '2025-11-26 04:22:14', 'aberto'),
(7, 16, 2, '2025-11-26 12:48:05', '2025-11-26 12:51:56', 'aberto'),
(8, 16, 4, '2025-11-26 12:49:38', '2025-11-26 12:49:38', 'aberto'),
(9, 17, 2, '2025-11-26 13:28:42', '2025-11-26 13:28:49', 'aberto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `denuncias`
--

CREATE TABLE `denuncias` (
  `id` int(11) NOT NULL,
  `objeto_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `data_denuncia` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `denuncias`
--

INSERT INTO `denuncias` (`id`, `objeto_id`, `usuario_id`, `motivo`, `data_denuncia`) VALUES
(1, 3, 1, 'Golpe ou fraude — anúncio suspeito solicitando pagamento antecipado.', '2025-11-18 10:15:00'),
(2, 3, 2, 'Informação falsa — dados do objeto não conferem com a realidade.', '2025-11-18 11:20:00'),
(3, 3, 6, 'Conteúdo sensível — mensagens agressivas no chat.', '2025-11-18 12:05:00'),
(4, 4, 7, 'Anúncio duplicado — mesmo objeto cadastrado duas vezes.', '2025-11-17 09:30:00'),
(5, 6, 5, 'Informação falsa — endereço não existe.', '2025-11-16 14:00:00'),
(7, 6, 16, 'Outro motivo — ja vi esse anuncio', '2025-11-26 09:50:46'),
(8, 10, 3, 'Outro motivo — szxcsdxfc', '2025-11-26 11:24:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `denuncias_avaliadas`
--

CREATE TABLE `denuncias_avaliadas` (
  `id` int(11) NOT NULL,
  `denuncia_id` int(11) NOT NULL,
  `resultado` varchar(80) NOT NULL,
  `score` int(11) NOT NULL,
  `data_analise` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_edicao`
--

CREATE TABLE `historico_edicao` (
  `id` int(11) NOT NULL,
  `objeto_id` int(11) DEFAULT NULL,
  `titulo_anterior` varchar(100) DEFAULT NULL,
  `descricao_anterior` text DEFAULT NULL,
  `data_edicao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico_edicao`
--

INSERT INTO `historico_edicao` (`id`, `objeto_id`, `titulo_anterior`, `descricao_anterior`, `data_edicao`) VALUES
(2, 4, 'Mochila de couro', 'Mochila de couro com livros.', '2025-10-10 15:30:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `de_usuario_id` int(11) DEFAULT NULL,
  `para_usuario_id` int(11) DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `data_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `chat_id`, `de_usuario_id`, `para_usuario_id`, `mensagem`, `data_envio`) VALUES
(1, 1, 2, 1, 'Oi Raissa, cadastrei uma carteira perdida no sistema.', '2025-11-21 18:01:00'),
(2, 1, 1, 2, 'Oi Adriana! Vi seu anúncio, encontrei uma carteira parecida próximo ao terminal.', '2025-11-21 18:03:00'),
(3, 1, 2, 1, 'Sério? Acho que pode ser a minha sim, tem um RG em meu nome dentro.', '2025-11-21 18:05:00'),
(4, 1, 1, 2, 'Tem um RG e um cartão do banco, podemos combinar a devolução amanhã.', '2025-11-21 18:07:00'),
(5, 2, 2, 4, 'Oi Carla, você encontrou um celular Samsung azul?', '2025-11-20 22:12:00'),
(6, 2, 4, 2, 'Encontrei sim, está com a tela um pouco rachada.', '2025-11-20 22:15:00'),
(7, 2, 2, 4, 'Acho que é do meu filho, podemos combinar a entrega na faculdade?', '2025-11-20 22:18:00'),
(8, 3, 3, 2, 'Oi Adriana, perdi minha mochila preta no bloco B.', '2025-11-19 12:05:00'),
(9, 3, 2, 3, 'Oi Douglas, vou ficar de olho, se alguém cadastrar eu te aviso aqui.', '2025-11-19 12:10:00'),
(10, 3, 3, 2, 'Obrigado! O FindMe está ajudando bastante nessas situações.', '2025-11-19 12:15:00'),
(15, 7, 16, 2, 'oii', '2025-11-26 09:51:56'),
(16, 9, 17, 2, 'oiii', '2025-11-26 10:28:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(11) UNSIGNED NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo` enum('chat','denuncia','avaliacao') NOT NULL DEFAULT 'chat',
  `titulo` varchar(120) NOT NULL,
  `mensagem` varchar(255) NOT NULL,
  `lida` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `link_destino` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `usuario_id`, `tipo`, `titulo`, `mensagem`, `lida`, `created_at`, `link_destino`) VALUES
(1, 2, 'chat', 'Nova mensagem no chat', 'Você recebeu uma nova mensagem de Raissa no chat sobre sua carteira perdida.', 1, '2025-11-21 15:05:30', 'chat.php?id=1'),
(2, 4, 'chat', 'Nova mensagem no chat', 'Adriana respondeu sobre o celular Samsung azul.', 1, '2025-11-20 19:18:30', 'chat.php?id=2'),
(3, 5, 'chat', 'Chat encerrado', 'A conversa sobre o RG foi marcada como concluída.', 1, '2025-11-19 09:25:00', 'chat.php?id=3'),
(4, 4, 'denuncia', 'Denúncia analisada', 'Sua denúncia sobre o anúncio \"Celular Samsung azul\" foi analisada.', 1, '2025-11-19 08:25:00', 'notificacoes.php'),
(5, 3, 'denuncia', 'Anúncio com denúncias', 'O anúncio \"Celular Samsung azul\" recebeu múltiplas denúncias. Verifique antes de prosseguir.', 1, '2025-11-19 08:30:00', 'detalhes_objeto.php?id=3'),
(6, 4, 'avaliacao', 'Você recebeu uma nova avaliação', 'Um usuário avaliou seu perfil com 5 estrelas.', 1, '2025-11-21 20:05:00', 'avaliar_usuario.php?id=4'),
(10, 2, 'denuncia', 'Anúncio com denúncias', 'O anúncio \"Celular Samsung azul\" recebeu múltiplas denúncias. Verifique antes de prosseguir.', 1, '2025-11-22 15:11:39', '../html/detalhes_objeto.php?id=XX'),
(11, 2, 'chat', 'Nova mensagem no chat', 'Você recebeu uma nova mensagem sobre o anúncio Bolsa Verde.', 1, '2025-11-23 23:57:31', 'chat.php?id=1'),
(12, 5, 'chat', 'Nova mensagem no chat', 'Você recebeu uma nova mensagem sobre o anúncio Bolsa Verde.', 1, '2025-11-23 23:58:18', 'chat.php?id=1'),
(13, 5, 'chat', 'Nova mensagem no chat', 'Você recebeu uma nova mensagem de Douglas Martins: \"aaaaaaaaaaaaaaaa\"', 1, '2025-11-24 00:11:56', 'chat.php?id=3'),
(14, 2, 'avaliacao', 'Você recebeu uma nova avaliação', 'Você foi avaliado por Teste com nota 5/5.', 1, '2025-11-26 09:48:21', 'perfil.php?id=2'),
(15, 4, 'avaliacao', 'Você recebeu uma nova avaliação', 'Você foi avaliado por Teste com nota 4/5.', 1, '2025-11-26 09:50:14', 'perfil.php?id=4'),
(16, 2, 'chat', 'Nova mensagem no chat', 'Você recebeu uma nova mensagem de Teste: \"oii\"', 1, '2025-11-26 09:51:56', 'chat.php?id=7'),
(17, 2, 'chat', 'Nova mensagem no chat', 'Você recebeu uma nova mensagem de Teste: \"oiii\"', 1, '2025-11-26 10:28:49', 'chat.php?id=9'),
(18, 2, 'avaliacao', 'Você recebeu uma nova avaliação', 'Você foi avaliado por Teste com nota 3/5.', 1, '2025-11-26 10:29:18', 'perfil.php?id=2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `objetos`
--

CREATE TABLE `objetos` (
  `id` int(11) NOT NULL,
  `tipo_objeto` enum('achado','perdido') NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `local_encontrado` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `data_encontrado` date DEFAULT NULL,
  `status` enum('perdido','encontrado','devolvido') DEFAULT 'perdido',
  `id_usuario` int(11) NOT NULL,
  `denuncia_total` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `denuncia_nivel` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `denuncia_avisar` tinyint(1) NOT NULL DEFAULT 0,
  `status_moderacao` enum('ativo','oculto') NOT NULL DEFAULT 'ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `objetos`
--

INSERT INTO `objetos` (`id`, `tipo_objeto`, `titulo`, `descricao`, `categoria`, `local_encontrado`, `imagem`, `latitude`, `longitude`, `data_encontrado`, `status`, `id_usuario`, `denuncia_total`, `denuncia_nivel`, `denuncia_avisar`, `status_moderacao`) VALUES
(2, 'achado', 'Carteira preta encontrada', 'Carteira de couro com documentos, encontrada próxima ao terminal.', 'Documentos', 'Praça ao lado do Terminal Central', 'fc759f539d2209dc.jpg', -23.55100000, -46.63250000, '2025-10-02', 'encontrado', 1, 0, 0, 0, 'ativo'),
(3, 'achado', 'Celular Samsung azul', 'Smartphone Samsung azul com capa transparente rachada.', 'Eletrônicos', 'Praça da Liberdade', '8bcc187c9d672d51.png', -23.55600000, -46.66000000, '2025-10-08', '', 4, 3, 2, 1, 'ativo'),
(4, 'perdido', 'Mochila preta com cadernos', 'Mochila preta com cadernos universitários, estojo e garrafa de água.', 'Acessórios', 'Corredor do bloco B da faculdade', '0e6ac367b06ea23a.png', -23.56300000, -46.64000000, '2025-10-09', 'perdido', 3, 1, 1, 0, 'ativo'),
(5, 'achado', 'Óculos de grau feminino', 'Óculos de grau com armação rosa, já devolvido para a dona.', 'Acessórios', 'Biblioteca Municipal', '73ec9f621d4fb15e.png', -23.54800000, -46.63500000, '2025-10-05', 'devolvido', 2, 0, 0, 0, 'ativo'),
(6, 'achado', 'RG em nome de João Pereira', 'Documento de identidade encontrado em via pública', 'Documentos', 'Rua das Flores, próximo ao número 120', '78baba10f54e5163.png', -23.54500000, -46.63000000, '2025-10-12', '', 3, 2, 1, 0, 'ativo'),
(10, 'achado', 'Fone de ouvido bluetooth', 'Fone de ouvido sem fio encontrado na sala de estudos.', 'Eletrônicos', 'Sala de estudos da biblioteca', 'acb6d8dd90c0e75b.png', -23.55250000, -46.64280000, '2025-10-15', '', 4, 1, 1, 0, 'ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `data_login` datetime DEFAULT current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('comum','administrador') DEFAULT 'comum',
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`, `data_cadastro`) VALUES
(1, 'Raissa Souza', 'raissa@example.com', '$2y$12$8s/5ISb3ifwrJOvIcbcjH.hxpcfblbXC6HG2shhAJmSDtwaUWjGqq', 'administrador', '2025-10-01 10:00:00'),
(2, 'Adriana Lima', 'adriana@example.com', '$2y$12$7SW4AcuzOD7qE1f3Hpu7mO7VE9Q4D/7ASFGaVaz9JlfFAuKB1nZaG', 'comum', '2025-10-02 09:30:00'),
(3, 'Douglas Martins', 'douglas@example.com', '$2y$12$vDEInNQ0IXBWh/QbjLqgc.GgwOVvyHa7rp1IwJOvzd4eRFyxEBlvy', 'comum', '2025-10-03 14:15:00'),
(4, 'Carla Mendes', 'carla@example.com', '$2y$12$u1AU4SDZk22aNqVEfp5GEerB2swiFzLiDi0qEsAHBNR4dnsrgCojC', 'comum', '2025-10-05 16:20:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `de_usuario_id` (`de_usuario_id`),
  ADD KEY `para_usuario_id` (`para_usuario_id`);

--
-- Índices de tabela `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario1_id` (`usuario1_id`),
  ADD KEY `usuario2_id` (`usuario2_id`);

--
-- Índices de tabela `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_denuncia_user_obj` (`usuario_id`,`objeto_id`),
  ADD UNIQUE KEY `uniq_user_obj` (`usuario_id`,`objeto_id`),
  ADD KEY `fk_denuncias_objeto` (`objeto_id`);

--
-- Índices de tabela `denuncias_avaliadas`
--
ALTER TABLE `denuncias_avaliadas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_denuncia` (`denuncia_id`);

--
-- Índices de tabela `historico_edicao`
--
ALTER TABLE `historico_edicao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `objeto_id` (`objeto_id`);

--
-- Índices de tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `de_usuario_id` (`de_usuario_id`),
  ADD KEY `para_usuario_id` (`para_usuario_id`),
  ADD KEY `fk_chat` (`chat_id`);

--
-- Índices de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notif_usuario` (`usuario_id`);

--
-- Índices de tabela `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`id_usuario`);

--
-- Índices de tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `denuncias_avaliadas`
--
ALTER TABLE `denuncias_avaliadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_edicao`
--
ALTER TABLE `historico_edicao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `objetos`
--
ALTER TABLE `objetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`de_usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`para_usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`usuario1_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`usuario2_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `denuncias_ibfk_1` FOREIGN KEY (`objeto_id`) REFERENCES `objetos` (`id`),
  ADD CONSTRAINT `denuncias_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_den_obj` FOREIGN KEY (`objeto_id`) REFERENCES `objetos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_den_user` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_denuncias_objeto` FOREIGN KEY (`objeto_id`) REFERENCES `objetos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_denuncias_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `denuncias_avaliadas`
--
ALTER TABLE `denuncias_avaliadas`
  ADD CONSTRAINT `fk_denuncia_avaliada` FOREIGN KEY (`denuncia_id`) REFERENCES `denuncias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `fk_chat` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`de_usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`para_usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `fk_notif_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `objetos`
--
ALTER TABLE `objetos`
  ADD CONSTRAINT `objetos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `sessoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
