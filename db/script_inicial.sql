
CREATE DATABASE chat;
USE chat;
CREATE TABLE dados (
    id INT PRIMARY KEY,
    curso VARCHAR(144),
    profissao VARCHAR(512),
    atividades VARCHAR(512),
    carga_horaria VARCHAR(72),
    estrutura VARCHAR(512),
    onde_fica VARCHAR(512),
    duracao VARCHAR(144),
    turno VARCHAR(144),
    diferenca VARCHAR(512),
    preco VARCHAR(144),
    desconto VARCHAR(512),
    trabalha_como VARCHAR(512),
    trabalha_onde VARCHAR(512)
    /*,
    horario_aula VARCHAR(144)*/
);

INSERT INTO dados VALUES
	(1,
    'Ciência de Dados e Inteligência Artificial',
    'desenvolvendo maneiras de analisar os dados disponíveis, desenvolver sistemas e metodologias de trabalho para a exploração de dados, aprofundando-se nos aspectos técnicos e de negócios, na busca de soluções para problemas complexos.',
    'Análise de negócios, Análise estatística, Aprendizado de máquina, Inteligência artificial, Gerenciamento e desenvolvimento de Bancos de Dados, Desenvolvimento de software, Processamento de grandes massas de dados, Processamento de imagens e sons e Visualização de dados.',
    '',
    '',
    'Campus Ecoville',
    'quatro anos',
    'Manhã e noite',
    'o curso está baseado na tradição que temos na área de Business Intelligence, Big Data e Inteligência Artificial, contando com uma grade curricular atualizada e alinhada com as necessidades do mercado de trabalho local e internacional.',
    '',
    '',
    'O Cientista de Dados pode trabalhar em todos os ramos da economia, mas há grandes demandas na área da saúde, podendo desenvolver soluções para apoio ao diagnóstico de doenças; no setor financeiro, com sistemas de prevenção à fraudes ou previsão de investimentos; e no e-commerce, com sistemas inteligentes para previsão dos comportamentos, de vendas ou das preferências de consumidores.',
    'As empresas que requerem Cientistas de Dados são empresas inovadoras, que acreditam que a tecnologia deve apoiar os negócios no seu estado mais avançado, utilizando modelos matemáticos, aprendizado de máquina e inteligência artificial para gerar mais valor agregado aos seus clientes.'
    );
    

INSERT INTO dados VALUES
	(2,
    'Tecnólogo em Análise e Desenvolvimento de Sistemas',
    'analisa, projeta, documenta, especifica, testa, implanta e mantém sistemas computacionais. Trabalha também com ferramentas e equipamentos de informática e metodologias de projetos na produção de sistemas de computador. ','Raciocínio lógico, emprego de linguagens de programação, projetos de sistemas de informação, bem como, preocupação com a qualidade, a usabilidade, a robustez, a integridade e a segurança de programas computacionais são fundamentais para atuação desse profissional.',
    '',
    '',
    'Em Curitiba, na praça Osório e no Hauer. E na cidade de Londrina',
    'dois anos e meio',
    'Manhã',
    'O tecnólogo em análise de dados da Universidade Positivo está alinhado com o mercado de trabaho, possui disciplinas práticas e tem uma ótima empregabilidade.',
    '',
    '',
    'O profissional formado em Análise e Desenvolvimento de Sistemas pode atuar como desenvolvedor de sistemas, analista de sistemas, gerente de projetos de software, administrador de banco de dados, analista de testes, entre outras funções que são demandadas no mercado de desenvolvimento de soluções de software.',
    'Grandes, médias e pequenas empresas demandam esses profissionais. O perfil das empresas onde os alunos atuam pode ter como atividade fim o desenvolvimento de softwares ou que precisam de software para realizar seus negócios.'
    );

INSERT INTO dados VALUES
	(3,
    'Tecnólogo em Jogos Digitais',
    'atuando na produção de um jogo digital, podendo exercer funções diretamente ligadas aos aspectos de planejamento, criação, geração de conteúdo, programação, arte, localização, narrativas, game design e validação dos jogos.',
    'Programação de jogos, Narrativas e roteiros, Modelagem 3D Game Design, Localização de jogos digitais, Produção Audiovisual, Desenvolvimento de projetos de jogos digitais e analógicos, Animação, Inteligência Artificial, Desenvolvimentode jogos para celulares e jogos online.',
    '',
    '',
    'Em Curitiba, na praça Osório e no Hauer. E na cidade de Londrina',
    'dois anos e meio','Manhã, tarde e noite',
    'Eu não fiz esse curso, mas acredito que Jogos Digitais é uma profissão com grande demanda, especialmente para que quiser trabalhar fora de Curitiba. Inclusive, as equipes da Jogos Digitais da Universidade Positivo foram campeãs na Imagine Cup em 2011, segundo lugar em 2012 e finalistas em 2014.',
    '',
    '',
    'O tecnólogo em Jogos Digitais pode trabalhar em todos os ramos que permeiam os jogos digitais. Há um mercado emergente que tem procurado as competências desse profissional, em especial no desenvolvimento de serious games (jogos sérios) nas áreas da saúde, educação e corporativos.','No ramo de jogos de entretenimento um mercado milionário tem se mostrado interessado nesse profissional que deseja futuramente trabalhar em uma grande produtora, ou lançar seu jogo de maneira independente'
    );


INSERT INTO dados VALUES
	(4,
    'Engenharia de Software',
    'produzindo software de qualidade e que atenda a necessidades de uma empresa, de uma área ou de pessoas. Sua atuação está voltada para a aplicação prática de técnicas formais que garantam a construção de sistemas computacionais com alto nível de excelência.','Especificar o software a ser desenvolvido, Projetar todos os componentes do software, incluindo técnicas formais para sua estrutura, funcionamento e segurança, Implementar e manter sistemas de software, Avaliar e garantir a qualidade do software desenvolvido.','','','Campus Ecoville','quatro anos','Pela manhã ou à noite','O Bacharelado em Engenharia de Software da UP se diferencia dos demais porque é sua grade curricular é atualizada e alinhada com as necessidades do mercado de trabalho local e internacional, trazendo para a sala de aula a vivência do mercado e o contato intenso com as empresas da região. ','','','O Engenheiro de Software trabalha projetando, desenvolvendo e mantendo sistemas de computadores em empresas de todas as áreas, de StartUPs, passando pelo governo até grandes empresas de tecnologia. Sua atuação é bastante ampla e há oportunidades de trabalho em empresas inovadoras, na construção de aplicativo móveis, sistemas distribuídos, aplicações para Web e soluções para apoio ao funcionamento das empresas.','empresas que utilizam os sistemas computacionais como base de suas atividades, seja na administração do negócio ou no desenvolvimento de aplicações que serão utilizadas por seus clientes. Desenvolvedoras de aplicativos móveis e sistemas para Internet, bem como o grandes desenvolvedores de sistemas para gestão.');

INSERT INTO dados VALUES
	(5,
    'Sistemas de Informação',
    'desenvolvendo e gerenciando sistemas computacionais para os processos de negócio das empresas de forma que elas atinjam seus objetivos estratégicos. Deve ser capaz de determinar os requisitos, desenvolver, evoluir e administrar os sistemas de informação, provendo assim, suporte às decisões que garantam vantagem competitiva das organizações.',
    'deve ter habilidades para compreender os modelos e as áreas de negócios, atuando como agentes de mudança no contexto organizacional, desenvolvendo pensamento analítico e sistêmico que permita analisar e entender os problemas e organizacionais.',
    '',
    '',
    'no campus Ecoville',
    'quatro anos',
    'De noite ou de manhã',
    'O Bacharelado em Sistemas de Informação da UP se diferencia dos demais porque é sua grade curricular é atualizada e alinhada com as necessidades do mercado de trabalho local e internacional, trazendo para a sala de aula a vivência do mercado e o contato intenso com as empresas da região. O curso conta com professores amplamente experientes no mercado de desenvolvimento de software e é orientado à prática no projeto e desenvolvimento de software de excelente qualidade.',
    '',
    '',
    'O Bacharel em Sistemas de Informação pode trabalhar como analista de sistemas, arquiteto de software, analista de dados, analista de segurança, administrador de banco de dados, gerente de projetos de TI, analista de testes e de qualidade de software, consultor de TI, entre outras áreas específicas. Além de atuar no mercado, é possível o ingresso em programas de Pós-Graduação (Especialização, Mestrado e Doutorado) para tornar-se pesquisador ou professor na área.',
    'Atualmente, não se encontram empresas e grandes corporações em que não haja o setor de TI. Seja para desenvolvimento de sistema, administração de serviços de TI, suporte e manutenção, o profissional de Sistemas de Informação pode atuar em empresas das mais diversas áreas do conhecimento, como grandes instituições financeiras, hospitais, instituições de ensino, indústria, comércio,  serviços, setor agroindustrial, empresas da área biomédica, empresas de assistência técnica e consultoria, entre outras.'
    );

INSERT INTO dados VALUES
	(6,
    'Engenharia da Computação',
    'lidando com diversas tecnologias, disponibilizando para a sociedade produtos eletrônicos inovadores para automatizar atividades e serviços (industriais, bancários e comerciais). Como Engenheiro da Computação você desenvolverá uma grande gama de sistemas complexos e embarcados, como os necessários para controlar as funções e a operação de, por exemplo, aviões, satélites e automóveis. ',
    'Não aprendi sobre isso ainda, por favor, procure um professor ou uma aluno que esteja aqui na mostra de profissões.',
    '',
    '',
    'no campus Ecoville',
    'cinco anos',
    'Manhã e noite',
    'O Curso de Engenharia da Computação da Universidade Positivo promove uma formação centrada no desenvolvimento de um aluno independente, criativo e capaz de solucionar problemas, além de estimular e aprimorar as capacidades humanísticas, de comunicação, de negociação e gerenciais comuns a todos os profissionais de sucesso. ','','','O Bacharel em Engenharia da Computação desenvolve uma grande variedade de sistemas complexos e embarcados, como os necessários para controlar as funções e a operação deaviões, satélites e automóveis, entre outros. ','Empresas inovadoras de desenvolvem sistemas para controle embarcado, controle residencial, redes de computadores e automação industrial.'
    );

INSERT INTO dados VALUES
	(7,
    'Ciência da Computação',
    'sendo responsável pelo desenvolvimento de estrutura e soluções computacionais, ou seja, pelo desenvolvimento de softwares e tecnologias que servem como base para outras áreas da computação.',
    'Como cientista da computação você poderá coordenar e supervisionar equipes de trabalho, seja no âmbito da pesquisa quanto na área de desenvolvimento tecnológico, desenvolver soluções para automação de processos computacionais em áreas diversas, bem como está habilitado para encontrar novas aplicações para o uso dos computadores.',
    '',
    '',
    'no campus Ecoville',
    'quatro anos',
    'De noite ou de manhã',
    'Eu não fiz esse curso, mas acredito que o curso de Ciencia da Computação é muito recomendado, porque a ncessidades por melhores programas de computadores, mais rápidos e mais seguros é grande e há um grande mercado de atuação, incluindo a chance de trabalhar com pesquisa e inovação tanto em Curitiba como no exterior.',
    '',
    '',
    'o profissional da Ciência da Computação é um resolvedor de problemas, é capaz de envolver-se em projetos transdisciplinares, amparando áreas como biologia, medicina e da própria computação.','empresas de desenvolvimento de software, na indústria de computadores, em empresas e laboratórios de pesquisa científica e tecnológica desenvolvendo novos algoritmos e tecnologias computacionais, no gerenciamento de dados de instituições financeiras, na análise de problemas e soluções.'
    );



SELECT 
    *
FROM
    dados;
    

