#lang racket

(require rackunit)
(require rackunit/text-ui)
(require memoize)
(require math/statistics)

(require "jaccard.rkt")
(require "longest-common.rkt")

(define str1 "Receita de bolo de chocolate fofinho. Ingredientes: 2 xícaras (chá) de farinha de trigo, 1 xícara (chá) de leite integral, 1 e 1/2 xícara (chá) de açúcar, 2 colheres (sopa) bem cheias de manteiga, 4 colheres (sopa) de chocolate em pó, 2 colheres (chá) de fermento, 4 ovos")
(define str2 "Ingredientes do melhor bolo de cenoura do mundo: 3 cenouras em pedaços, 1 xícara (chá) de óleo, 3 ovos, 2 xícaras (chá) de açúcar, 3 xícaras (chá) de farinha de trigo, 1 colher (sopa) de fermento em pó químico, Margarina e farinha de trigo para untar e enfarinhar")
;;resultado esperado 0.3047
(define str3 "Hokey religions and ancient weapons are no match for a good blaster at your side, kid. I don't know what you're talking about. I am a member of the Imperial Senate on a diplomatic mission to Alderaan. I want to come with you to Alderaan. There's nothing for me here now. I want to learn the ways of the Force and be a Jedi, like my father before me. I care. So, what do you think of her, Han? I care. So, what do you think of her, Han? But with the blast shield down, I can't even see! How am I supposed to fight? Ye-ha! I want to come with you to Alderaan. There's nothing for me here now. I want to learn the ways of the Force and be a Jedi, like my father before me.")
(define str4 "I want to come with you to Alderaan. There's nothing for me here now. I want to learn the ways of the Force and be a Jedi, like my father before me. Ye-ha! Hokey religions and ancient weapons are no match for a good blaster at your side, kid. I have traced the Rebel spies to her. Now she is my only link to finding their secret base. Still, she's got a lot of spirit. I don't know, what do you think? Hokey religions and ancient weapons are no match for a good blaster at your side, kid. He is here. All right. Well, take care of yourself, Han. I guess that's what you're best at, ain't it? I need your help, Luke. She needs your help. I'm getting too old for this sort of thing. I'm trying not to, kid.")
;;resultado esperado 0.3617
(define str5 "Inteligência artificial (artificial intelligence - A.I., em inglês) é um ramo de pesquisa da Ciência da Computação que se ocupa em desenvolver mecanismos e dispositivos tecnológicos que possam simular o raciocínio humano, ou seja, a inteligência que é característica dos seres humanos.")
(define str6 "A inteligência artificial é um ramo de pesquisa da Ciência da Computação que busca, através de símbolos computacionais, construir mecanismos e/ou dispositivos que simulem a capacidade do ser humano de pensar, resolver problemas, ou seja, de ser inteligente.")
;;resultado esperado 0.5795
(define str7 "O paradigma funcional é baseado em aplicação de funções matemáticas e tem características marcantes como o conceito de imutabilidade e uso intenso de recursividade. Diferente das linguagens imperativas, que se baseiam na mudança de estado do programa uma linguagem funcional trabalha com estruturas imutáveis, o resultado do programa é resultante da aplicação de uma função.")
(define str8 "Em ciência da computação, programação funcional é um paradigma de programação que trata a computação como uma avaliação de funções matemáticas e que evita estados ou dados mutáveis. Ela enfatiza a aplicação de funções, em contraste da programação imperativa, que enfatiza mudanças no estado do programa. Enfatizando as expressões ao invés de comandos, as expressões são utilizados para cálculo de valores com dados imutáveis.")
;;resultado esperado 0.4212

(define listaEsperado (list 0.3047 0.3617 0.5795 0.4212))

(define resul1 (longest-common-sub str1 str2))
(define resul2 (longest-common-sub str3 str4))
(define resul3 (longest-common-sub str5 str6))
(define resul4 (longest-common-sub str7 str8))
(define listaLcs (list resul1 resul2 resul3 resul4))

(define resul5 (jaccard str1 str2))
(define resul6 (jaccard str3 str4))
(define resul7 (jaccard str5 str6))
(define resul8 (jaccard str7 str8))
(define listaJac (list resul5 resul6 resul7 resul8))

(define correLcs (correlation listaLcs listaEsperado))
(define correJac (correlation listaJac listaEsperado))

(define (resultados correLcs correJac)
    (printf "Correlação do LCS: ~a\n" correLcs)
    (printf "Correlação do Jaccard: ~a\n" correJac)
)

(resultados listaLcs listaJac)
(resultados correLcs correJac)