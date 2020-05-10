PGDMP                  	        x            MasterStock    12.2    12.2 e    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16393    MasterStock    DATABASE     �   CREATE DATABASE "MasterStock" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "MasterStock";
                postgres    false            �            1259    16535    agendamento    TABLE       CREATE TABLE public.agendamento (
    id integer NOT NULL,
    funcionario_id integer NOT NULL,
    titulo character varying(200),
    descricao text,
    data timestamp without time zone NOT NULL,
    estado character(1) NOT NULL,
    ativo character(1) NOT NULL
);
    DROP TABLE public.agendamento;
       public         heap    postgres    false            �            1259    16422 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    ativo character(1) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16430    departamento    TABLE     �   CREATE TABLE public.departamento (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    ativo character(1) NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    16394    endereco    TABLE     K  CREATE TABLE public.endereco (
    id integer NOT NULL,
    cidade character varying(150) NOT NULL,
    rua character varying(45) NOT NULL,
    numero character varying(5) NOT NULL,
    bairro character varying(45),
    cep character varying(10) NOT NULL,
    complementos character varying(25),
    ativo character(1) NOT NULL
);
    DROP TABLE public.endereco;
       public         heap    postgres    false            �            1259    16522    estoque    TABLE     �   CREATE TABLE public.estoque (
    id integer NOT NULL,
    endereco_id integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    telefone character varying(25) NOT NULL,
    ativo character(1) NOT NULL
);
    DROP TABLE public.estoque;
       public         heap    postgres    false            �            1259    16558    estoque_has_produto    TABLE       CREATE TABLE public.estoque_has_produto (
    insercao_id integer NOT NULL,
    estoque_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade double precision NOT NULL,
    valorunitario double precision NOT NULL,
    ativo character(1) NOT NULL
);
 '   DROP TABLE public.estoque_has_produto;
       public         heap    postgres    false            �            1259    16412    funcionario    TABLE       CREATE TABLE public.funcionario (
    id integer NOT NULL,
    pessoa_id integer NOT NULL,
    login character varying(85) NOT NULL,
    senha character varying(40) NOT NULL,
    funcao character varying(100) NOT NULL,
    nivelacesso character(1) NOT NULL,
    email character varying(100) NOT NULL,
    senhaemail character varying(45) NOT NULL,
    ativo character(1) NOT NULL
);
    DROP TABLE public.funcionario;
       public         heap    postgres    false            �            1259    16548    insercao    TABLE     �   CREATE TABLE public.insercao (
    id integer NOT NULL,
    funcionario_id integer NOT NULL,
    data date NOT NULL,
    nfe bigint,
    ativo character(1) NOT NULL
);
    DROP TABLE public.insercao;
       public         heap    postgres    false            �            1259    16670    log    TABLE     �   CREATE TABLE public.log (
    id integer NOT NULL,
    funcionario_id integer NOT NULL,
    data timestamp without time zone,
    tipo character(1),
    mensagem text
);
    DROP TABLE public.log;
       public         heap    postgres    false            �            1259    16446    marca    TABLE     �   CREATE TABLE public.marca (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    ativo character(1) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    16479    nfe    TABLE     m  CREATE TABLE public.nfe (
    id integer NOT NULL,
    pessoarem_id integer,
    enderecorem_id integer NOT NULL,
    pessoadest_id integer NOT NULL,
    enderecodest_id integer NOT NULL,
    numnf integer,
    dataemissao date NOT NULL,
    valornota numeric(13,3) NOT NULL,
    tipo character(1) NOT NULL,
    observacoes text,
    ativo character(1) NOT NULL
);
    DROP TABLE public.nfe;
       public         heap    postgres    false            �            1259    16507    nfe_has_produto    TABLE     �   CREATE TABLE public.nfe_has_produto (
    nfe_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade double precision NOT NULL,
    valorprodutos double precision NOT NULL,
    ativo character(1) NOT NULL
);
 #   DROP TABLE public.nfe_has_produto;
       public         heap    postgres    false            �            1259    16640 
   permissoes    TABLE     �   CREATE TABLE public.permissoes (
    id integer NOT NULL,
    funcionario_id integer NOT NULL,
    regra character varying(100) NOT NULL,
    ativo character(1) NOT NULL
);
    DROP TABLE public.permissoes;
       public         heap    postgres    false            �            1259    16399    pessoa    TABLE     >  CREATE TABLE public.pessoa (
    id integer NOT NULL,
    endereco_id integer NOT NULL,
    denominacaosocial character varying(90),
    nome character varying(55),
    email character varying(45),
    cnpj character varying(45),
    cpf character varying(14),
    observacoes text,
    ativo character(1) NOT NULL
);
    DROP TABLE public.pessoa;
       public         heap    postgres    false            �            1259    16625    pessoa_has_agendamento    TABLE     �   CREATE TABLE public.pessoa_has_agendamento (
    pessoa_id integer NOT NULL,
    agendamento_id integer NOT NULL,
    agendamento_funcionario_id integer NOT NULL,
    ativo character(1) NOT NULL
);
 *   DROP TABLE public.pessoa_has_agendamento;
       public         heap    postgres    false            �            1259    16591    pessoa_has_telefones    TABLE     �   CREATE TABLE public.pessoa_has_telefones (
    pessoa_id integer NOT NULL,
    telefones_id integer NOT NULL,
    descricao text,
    ativo character(1) NOT NULL
);
 (   DROP TABLE public.pessoa_has_telefones;
       public         heap    postgres    false            �            1259    16609    pessoa_has_tipo    TABLE     �   CREATE TABLE public.pessoa_has_tipo (
    pessoa_id integer NOT NULL,
    tipo_id integer NOT NULL,
    ativo character(1) NOT NULL
);
 #   DROP TABLE public.pessoa_has_tipo;
       public         heap    postgres    false            �            1259    16454    produto    TABLE     �  CREATE TABLE public.produto (
    id integer NOT NULL,
    marca_id integer NOT NULL,
    departamento_id integer NOT NULL,
    categoria_id integer NOT NULL,
    unidade_id integer NOT NULL,
    nome character varying(45) NOT NULL,
    descricao character varying(45) NOT NULL,
    quantidade double precision NOT NULL,
    custounitario numeric(11,2) NOT NULL,
    ativo character(1) NOT NULL
);
    DROP TABLE public.produto;
       public         heap    postgres    false            �            1259    16650    sensor    TABLE     �   CREATE TABLE public.sensor (
    id integer NOT NULL,
    estoque_id integer,
    nome character varying(200),
    mac character varying(20),
    ip character varying(20)
);
    DROP TABLE public.sensor;
       public         heap    postgres    false            �            1259    16578 	   telefones    TABLE     �   CREATE TABLE public.telefones (
    id integer NOT NULL,
    numero character varying(45) NOT NULL,
    ativo character(1) NOT NULL
);
    DROP TABLE public.telefones;
       public         heap    postgres    false            �            1259    16660    temperatura    TABLE     �   CREATE TABLE public.temperatura (
    id integer NOT NULL,
    sensor_id integer NOT NULL,
    temperatura character varying(45),
    humidade character varying(45)
);
    DROP TABLE public.temperatura;
       public         heap    postgres    false            �            1259    16583    tipo    TABLE     �   CREATE TABLE public.tipo (
    id integer NOT NULL,
    nome character varying(45) NOT NULL,
    descricao text,
    ativo character(1) NOT NULL
);
    DROP TABLE public.tipo;
       public         heap    postgres    false            �            1259    16438    unidade    TABLE     �   CREATE TABLE public.unidade (
    id integer NOT NULL,
    nome character varying(45) NOT NULL,
    sigla character varying(2) NOT NULL,
    descricao text,
    ativo character(1) NOT NULL
);
    DROP TABLE public.unidade;
       public         heap    postgres    false            �          0    16535    agendamento 
   TABLE DATA                 public          postgres    false    213   �|       �          0    16422 	   categoria 
   TABLE DATA                 public          postgres    false    205   �|       �          0    16430    departamento 
   TABLE DATA                 public          postgres    false    206   �|       �          0    16394    endereco 
   TABLE DATA                 public          postgres    false    202   }       �          0    16522    estoque 
   TABLE DATA                 public          postgres    false    212   )}       �          0    16558    estoque_has_produto 
   TABLE DATA                 public          postgres    false    215   C}       �          0    16412    funcionario 
   TABLE DATA                 public          postgres    false    204   ]}       �          0    16548    insercao 
   TABLE DATA                 public          postgres    false    214   w}       �          0    16670    log 
   TABLE DATA                 public          postgres    false    224   �}       �          0    16446    marca 
   TABLE DATA                 public          postgres    false    208   �}       �          0    16479    nfe 
   TABLE DATA                 public          postgres    false    210   �}       �          0    16507    nfe_has_produto 
   TABLE DATA                 public          postgres    false    211   �}       �          0    16640 
   permissoes 
   TABLE DATA                 public          postgres    false    221   �}       �          0    16399    pessoa 
   TABLE DATA                 public          postgres    false    203   ~       �          0    16625    pessoa_has_agendamento 
   TABLE DATA                 public          postgres    false    220   -~       �          0    16591    pessoa_has_telefones 
   TABLE DATA                 public          postgres    false    218   G~       �          0    16609    pessoa_has_tipo 
   TABLE DATA                 public          postgres    false    219   a~       �          0    16454    produto 
   TABLE DATA                 public          postgres    false    209   {~       �          0    16650    sensor 
   TABLE DATA                 public          postgres    false    222   �~       �          0    16578 	   telefones 
   TABLE DATA                 public          postgres    false    216   �~       �          0    16660    temperatura 
   TABLE DATA                 public          postgres    false    223   �~       �          0    16583    tipo 
   TABLE DATA                 public          postgres    false    217   �~       �          0    16438    unidade 
   TABLE DATA                 public          postgres    false    207   �~       �
           2606    16542    agendamento agendamento_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT agendamento_pkey PRIMARY KEY (id, funcionario_id);
 F   ALTER TABLE ONLY public.agendamento DROP CONSTRAINT agendamento_pkey;
       public            postgres    false    213    213            �
           2606    16429    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    205            �
           2606    16437    departamento departamento_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    206            �
           2606    16398    endereco endereco_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public            postgres    false    202            �
           2606    16562 ,   estoque_has_produto estoque_has_produto_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estoque_has_produto
    ADD CONSTRAINT estoque_has_produto_pkey PRIMARY KEY (insercao_id, estoque_id, produto_id);
 V   ALTER TABLE ONLY public.estoque_has_produto DROP CONSTRAINT estoque_has_produto_pkey;
       public            postgres    false    215    215    215            �
           2606    16529    estoque estoque_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_pkey;
       public            postgres    false    212            �
           2606    16416    funcionario funcionario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public            postgres    false    204            �
           2606    16552    insercao insercao_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.insercao
    ADD CONSTRAINT insercao_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.insercao DROP CONSTRAINT insercao_pkey;
       public            postgres    false    214                       2606    16677    log log_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id, funcionario_id);
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    224    224            �
           2606    16453    marca marca_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            postgres    false    208            �
           2606    16511 $   nfe_has_produto nfe_has_produto_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.nfe_has_produto
    ADD CONSTRAINT nfe_has_produto_pkey PRIMARY KEY (nfe_id, produto_id);
 N   ALTER TABLE ONLY public.nfe_has_produto DROP CONSTRAINT nfe_has_produto_pkey;
       public            postgres    false    211    211            �
           2606    16486    nfe nfe_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.nfe
    ADD CONSTRAINT nfe_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.nfe DROP CONSTRAINT nfe_pkey;
       public            postgres    false    210                       2606    16644    permissoes permissoes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (id, funcionario_id);
 D   ALTER TABLE ONLY public.permissoes DROP CONSTRAINT permissoes_pkey;
       public            postgres    false    221    221                       2606    16629 2   pessoa_has_agendamento pessoa_has_agendamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_agendamento
    ADD CONSTRAINT pessoa_has_agendamento_pkey PRIMARY KEY (pessoa_id, agendamento_id, agendamento_funcionario_id);
 \   ALTER TABLE ONLY public.pessoa_has_agendamento DROP CONSTRAINT pessoa_has_agendamento_pkey;
       public            postgres    false    220    220    220                       2606    16598 .   pessoa_has_telefones pessoa_has_telefones_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_telefones
    ADD CONSTRAINT pessoa_has_telefones_pkey PRIMARY KEY (pessoa_id, telefones_id);
 X   ALTER TABLE ONLY public.pessoa_has_telefones DROP CONSTRAINT pessoa_has_telefones_pkey;
       public            postgres    false    218    218                       2606    16613 $   pessoa_has_tipo pessoa_has_tipo_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.pessoa_has_tipo
    ADD CONSTRAINT pessoa_has_tipo_pkey PRIMARY KEY (pessoa_id, tipo_id);
 N   ALTER TABLE ONLY public.pessoa_has_tipo DROP CONSTRAINT pessoa_has_tipo_pkey;
       public            postgres    false    219    219            �
           2606    16406    pessoa pessoa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public            postgres    false    203            �
           2606    16458    produto produto_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    209            	           2606    16654    sensor sensor_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.sensor DROP CONSTRAINT sensor_pkey;
       public            postgres    false    222            �
           2606    16582    telefones telefones_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.telefones
    ADD CONSTRAINT telefones_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.telefones DROP CONSTRAINT telefones_pkey;
       public            postgres    false    216                       2606    16664    temperatura temperatura_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.temperatura
    ADD CONSTRAINT temperatura_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.temperatura DROP CONSTRAINT temperatura_pkey;
       public            postgres    false    223            �
           2606    16590    tipo tipo_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tipo DROP CONSTRAINT tipo_pkey;
       public            postgres    false    217            �
           2606    16445    unidade unidade_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT unidade_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.unidade DROP CONSTRAINT unidade_pkey;
       public            postgres    false    207            &           2606    16645 !   permissoes fk_acesso_funcionario1    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissoes
    ADD CONSTRAINT fk_acesso_funcionario1 FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);
 K   ALTER TABLE ONLY public.permissoes DROP CONSTRAINT fk_acesso_funcionario1;
       public          postgres    false    204    2789    221                       2606    16543 '   agendamento fk_agendamento_funcionario1    FK CONSTRAINT     �   ALTER TABLE ONLY public.agendamento
    ADD CONSTRAINT fk_agendamento_funcionario1 FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);
 Q   ALTER TABLE ONLY public.agendamento DROP CONSTRAINT fk_agendamento_funcionario1;
       public          postgres    false    2789    213    204                       2606    16407    pessoa fk_endereco    FK CONSTRAINT     x   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT fk_endereco FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT fk_endereco;
       public          postgres    false    2785    202    203                       2606    16530    estoque fk_estoque_endereco1    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT fk_estoque_endereco1 FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);
 F   ALTER TABLE ONLY public.estoque DROP CONSTRAINT fk_estoque_endereco1;
       public          postgres    false    202    212    2785                       2606    16563 3   estoque_has_produto fk_estoque_has_produto_estoque1    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque_has_produto
    ADD CONSTRAINT fk_estoque_has_produto_estoque1 FOREIGN KEY (estoque_id) REFERENCES public.estoque(id);
 ]   ALTER TABLE ONLY public.estoque_has_produto DROP CONSTRAINT fk_estoque_has_produto_estoque1;
       public          postgres    false    212    215    2805                       2606    16573 4   estoque_has_produto fk_estoque_has_produto_insercao1    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque_has_produto
    ADD CONSTRAINT fk_estoque_has_produto_insercao1 FOREIGN KEY (insercao_id) REFERENCES public.insercao(id);
 ^   ALTER TABLE ONLY public.estoque_has_produto DROP CONSTRAINT fk_estoque_has_produto_insercao1;
       public          postgres    false    214    215    2809                       2606    16568 3   estoque_has_produto fk_estoque_has_produto_produto1    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque_has_produto
    ADD CONSTRAINT fk_estoque_has_produto_produto1 FOREIGN KEY (produto_id) REFERENCES public.produto(id);
 ]   ALTER TABLE ONLY public.estoque_has_produto DROP CONSTRAINT fk_estoque_has_produto_produto1;
       public          postgres    false    209    215    2799                       2606    16553 !   insercao fk_insercao_funcionario1    FK CONSTRAINT     �   ALTER TABLE ONLY public.insercao
    ADD CONSTRAINT fk_insercao_funcionario1 FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);
 K   ALTER TABLE ONLY public.insercao DROP CONSTRAINT fk_insercao_funcionario1;
       public          postgres    false    204    214    2789            )           2606    16678    log fk_log_funcionario1    FK CONSTRAINT     �   ALTER TABLE ONLY public.log
    ADD CONSTRAINT fk_log_funcionario1 FOREIGN KEY (funcionario_id) REFERENCES public.funcionario(id);
 A   ALTER TABLE ONLY public.log DROP CONSTRAINT fk_log_funcionario1;
       public          postgres    false    224    204    2789                       2606    16497    nfe fk_nfe_endereco1    FK CONSTRAINT     }   ALTER TABLE ONLY public.nfe
    ADD CONSTRAINT fk_nfe_endereco1 FOREIGN KEY (enderecorem_id) REFERENCES public.endereco(id);
 >   ALTER TABLE ONLY public.nfe DROP CONSTRAINT fk_nfe_endereco1;
       public          postgres    false    2785    202    210                       2606    16502    nfe fk_nfe_endereco2    FK CONSTRAINT     ~   ALTER TABLE ONLY public.nfe
    ADD CONSTRAINT fk_nfe_endereco2 FOREIGN KEY (enderecodest_id) REFERENCES public.endereco(id);
 >   ALTER TABLE ONLY public.nfe DROP CONSTRAINT fk_nfe_endereco2;
       public          postgres    false    2785    210    202                       2606    16512 '   nfe_has_produto fk_nfe_has_produto_nfe1    FK CONSTRAINT     �   ALTER TABLE ONLY public.nfe_has_produto
    ADD CONSTRAINT fk_nfe_has_produto_nfe1 FOREIGN KEY (nfe_id) REFERENCES public.nfe(id);
 Q   ALTER TABLE ONLY public.nfe_has_produto DROP CONSTRAINT fk_nfe_has_produto_nfe1;
       public          postgres    false    2801    210    211                       2606    16517 +   nfe_has_produto fk_nfe_has_produto_produto1    FK CONSTRAINT     �   ALTER TABLE ONLY public.nfe_has_produto
    ADD CONSTRAINT fk_nfe_has_produto_produto1 FOREIGN KEY (produto_id) REFERENCES public.produto(id);
 U   ALTER TABLE ONLY public.nfe_has_produto DROP CONSTRAINT fk_nfe_has_produto_produto1;
       public          postgres    false    2799    211    209                       2606    16487    nfe fk_nfe_pessoa1    FK CONSTRAINT     w   ALTER TABLE ONLY public.nfe
    ADD CONSTRAINT fk_nfe_pessoa1 FOREIGN KEY (pessoarem_id) REFERENCES public.pessoa(id);
 <   ALTER TABLE ONLY public.nfe DROP CONSTRAINT fk_nfe_pessoa1;
       public          postgres    false    203    2787    210                       2606    16492    nfe fk_nfe_pessoa2    FK CONSTRAINT     x   ALTER TABLE ONLY public.nfe
    ADD CONSTRAINT fk_nfe_pessoa2 FOREIGN KEY (pessoadest_id) REFERENCES public.pessoa(id);
 <   ALTER TABLE ONLY public.nfe DROP CONSTRAINT fk_nfe_pessoa2;
       public          postgres    false    210    2787    203                       2606    16417    funcionario fk_pessoa    FK CONSTRAINT     w   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);
 ?   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT fk_pessoa;
       public          postgres    false    203    204    2787            %           2606    16635 =   pessoa_has_agendamento fk_pessoa_has_agendamento_agendamento1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_agendamento
    ADD CONSTRAINT fk_pessoa_has_agendamento_agendamento1 FOREIGN KEY (agendamento_id, agendamento_funcionario_id) REFERENCES public.agendamento(id, funcionario_id);
 g   ALTER TABLE ONLY public.pessoa_has_agendamento DROP CONSTRAINT fk_pessoa_has_agendamento_agendamento1;
       public          postgres    false    220    213    220    213    2807            $           2606    16630 8   pessoa_has_agendamento fk_pessoa_has_agendamento_pessoa1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_agendamento
    ADD CONSTRAINT fk_pessoa_has_agendamento_pessoa1 FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);
 b   ALTER TABLE ONLY public.pessoa_has_agendamento DROP CONSTRAINT fk_pessoa_has_agendamento_pessoa1;
       public          postgres    false    2787    203    220                        2606    16599 4   pessoa_has_telefones fk_pessoa_has_telefones_pessoa1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_telefones
    ADD CONSTRAINT fk_pessoa_has_telefones_pessoa1 FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);
 ^   ALTER TABLE ONLY public.pessoa_has_telefones DROP CONSTRAINT fk_pessoa_has_telefones_pessoa1;
       public          postgres    false    2787    203    218            !           2606    16604 7   pessoa_has_telefones fk_pessoa_has_telefones_telefones1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_telefones
    ADD CONSTRAINT fk_pessoa_has_telefones_telefones1 FOREIGN KEY (telefones_id) REFERENCES public.telefones(id);
 a   ALTER TABLE ONLY public.pessoa_has_telefones DROP CONSTRAINT fk_pessoa_has_telefones_telefones1;
       public          postgres    false    2813    216    218            "           2606    16614 *   pessoa_has_tipo fk_pessoa_has_tipo_pessoa1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_tipo
    ADD CONSTRAINT fk_pessoa_has_tipo_pessoa1 FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);
 T   ALTER TABLE ONLY public.pessoa_has_tipo DROP CONSTRAINT fk_pessoa_has_tipo_pessoa1;
       public          postgres    false    2787    219    203            #           2606    16619 (   pessoa_has_tipo fk_pessoa_has_tipo_tipo1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pessoa_has_tipo
    ADD CONSTRAINT fk_pessoa_has_tipo_tipo1 FOREIGN KEY (tipo_id) REFERENCES public.tipo(id);
 R   ALTER TABLE ONLY public.pessoa_has_tipo DROP CONSTRAINT fk_pessoa_has_tipo_tipo1;
       public          postgres    false    219    217    2815                       2606    16464    produto fk_produto_categoria1    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_categoria1 FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 G   ALTER TABLE ONLY public.produto DROP CONSTRAINT fk_produto_categoria1;
       public          postgres    false    209    205    2791                       2606    16459     produto fk_produto_departamento1    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_departamento1 FOREIGN KEY (departamento_id) REFERENCES public.departamento(id);
 J   ALTER TABLE ONLY public.produto DROP CONSTRAINT fk_produto_departamento1;
       public          postgres    false    206    2793    209                       2606    16474    produto fk_produto_marca1    FK CONSTRAINT     y   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_marca1 FOREIGN KEY (marca_id) REFERENCES public.marca(id);
 C   ALTER TABLE ONLY public.produto DROP CONSTRAINT fk_produto_marca1;
       public          postgres    false    209    208    2797                       2606    16469    produto fk_produto_unidade1    FK CONSTRAINT        ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_unidade1 FOREIGN KEY (unidade_id) REFERENCES public.unidade(id);
 E   ALTER TABLE ONLY public.produto DROP CONSTRAINT fk_produto_unidade1;
       public          postgres    false    207    209    2795            '           2606    16655    sensor fk_sensor_estoque1    FK CONSTRAINT     }   ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT fk_sensor_estoque1 FOREIGN KEY (estoque_id) REFERENCES public.estoque(id);
 C   ALTER TABLE ONLY public.sensor DROP CONSTRAINT fk_sensor_estoque1;
       public          postgres    false    212    222    2805            (           2606    16665 "   temperatura fk_temperatura_sensor1    FK CONSTRAINT     �   ALTER TABLE ONLY public.temperatura
    ADD CONSTRAINT fk_temperatura_sensor1 FOREIGN KEY (sensor_id) REFERENCES public.sensor(id);
 L   ALTER TABLE ONLY public.temperatura DROP CONSTRAINT fk_temperatura_sensor1;
       public          postgres    false    2825    223    222            �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���         