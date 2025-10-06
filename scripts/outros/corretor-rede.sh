#!/bin/bash
# Corretor de Panfletos da Rede Econômica

# TODO
# Deletar carnes com g ao invéz de kg
# Arrumar ovos brancos kg
# Selecionar carnes com OR (|) ao invés de um por linha
# Converter arquivo para Western (Mac Roman)

# Variáveis
PANFLETO="/Users/mac/Desktop/temp.txt"       # caminho para o arquivo do panfleto
TEMP="/Users/mac/Desktop/em-processo.txt"    # caminho para o arquivo temporário
CORRIGIDO="/Users/mac/Desktop/corrigido.txt" # caminho para o arquivo final

/usr/bin/pbpaste >> '/Users/mac/Desktop/temp.txt'

# Passa tudo para minúscula
/usr/bin/tr '[:upper:]' '[:lower:]' < $PANFLETO > $TEMP

# Primeira correção dos espaços extras e tabs
/usr/bin/sed -i -e 's/  */ /g' $TEMP  # deleta espaços extras
/usr/bin/sed -i -e 's/ 	/	/g' $TEMP   # deleta espaços à direita de uma tab
/usr/bin/sed -i -e 's/	 /	/g' $TEMP # deleta espaços à esquerda de uma tab

# Correções das gramagens
/usr/bin/sed -i -e 's/\([0-9]\)grs/\1\g/g' $TEMP # gramas
/usr/bin/sed -i -e 's/\([0-9]\)gr/\1\g/g' $TEMP # gramas
/usr/bin/sed -i -e 's/\([0-9]\)lt/\1\L/g' $TEMP # litros
/usr/bin/sed -i -e 's/\([0-9]\)mts/\1\m/g' $TEMP # metros
/usr/bin/sed -i -e 's/\([0-9]\)mtrs/\1\m/g' $TEMP # metros
/usr/bin/sed -i -e 's/\([0-9]\)	/\1\ unid	/g' $TEMP # com x unid
/usr/bin/sed -i -e 's/ dz/ dúzia/g' $TEMP

# Correção dos preços sem zeros depois da vírgula
/usr/bin/sed -i -e 's/\([0-9],[0-9]\)$/\1\0/g' $TEMP
/usr/bin/sed -i -e 's/\([0-9],\)$/\1\00/g' $TEMP

# Correções digitação
/usr/bin/sed -i -e 's/moid\([ao]\)/moíd\1/g' $TEMP
/usr/bin/sed -i -e 's/suin\([ao]\)/suín\1/g' $TEMP
/usr/bin/sed -i -e 's/agua/água/g' $TEMP
/usr/bin/sed -i -e 's/ t1/ tipo 1/g' $TEMP
/usr/bin/sed -i -e 's/oleo/óleo/g' $TEMP
/usr/bin/sed -i -e 's/oléo/óleo/g' $TEMP
/usr/bin/sed -i -e 's/a[cç][uú]car/açúcar/g' $TEMP
/usr/bin/sed -i -e 's/frances/francês/g' $TEMP
/usr/bin/sed -i -e 's/sachet/sachê/g'  $TEMP
/usr/bin/sed -i -e 's/nestle/nestlé/g' $TEMP
/usr/bin/sed -i -e 's/cafe/café/g' $TEMP
/usr/bin/sed -i -e 's/nect[ae]r/néctar/g' $TEMP
/usr/bin/sed -i -e 's/alcool/álcool/g' $TEMP
/usr/bin/sed -i -e 's/higienic\([ao]\)/higiênic\1/g' $TEMP
/usr/bin/sed -i -e 's/sanitari\([ao]\)/sanitári\1/g' $TEMP
/usr/bin/sed -i -e 's/a[çc][aã]o/ação/g' $TEMP
/usr/bin/sed -i -e 's/1[.-]2[.-]3/1•2•3/g' $TEMP
/usr/bin/sed -i -e 's/acem/acém/g' $TEMP
/usr/bin/sed -i -e 's/wolff/wolf/g' $TEMP
/usr/bin/sed -i -e 's/ovo[s] branco[s] grande[s]/ovos brancos grandes/g' $TEMP
/usr/bin/sed -i -e 's/ovo[s] branco[s] m[eé]dio[s]/ovos brancos médios/g' $TEMP
/usr/bin/sed -i -e 's/perola/pérola/g' $TEMP
/usr/bin/sed -i -e 's/abobora/abóbora/g' $TEMP
/usr/bin/sed -i -e 's/brocolis/brócolis/g' $TEMP
/usr/bin/sed -i -e 's/pe[çc]a kg/peça/g' $TEMP
/usr/bin/sed -i -e 's/limao/limão/g' $TEMP
/usr/bin/sed -i -e 's/ma[cç]a /maçã /g' $TEMP
/usr/bin/sed -i -e 's/debora/débora/g' $TEMP
/usr/bin/sed -i -e 's/s\/coxa/com sobrecoxa/g' $TEMP
/usr/bin/sed -i -e 's/s\/ coxa/com sobrecoxa/g' $TEMP
/usr/bin/sed -i -e 's/pct/pacote/g' $TEMP
/usr/bin/sed -i -e 's/file/filé/g' $TEMP
/usr/bin/sed -i -e 's/filézinho/filezinho/g' $TEMP
/usr/bin/sed -i -e 's/a role/à rolê/g' $TEMP
/usr/bin/sed -i -e 's/figado/fígado/g' $TEMP
/usr/bin/sed -i -e 's/pe[cç]a peda[cç]o/peça ou pedaço/g' $TEMP
/usr/bin/sed -i -e 's/pe[cç]a\/ peda[cç]o/peça ou pedaço/g' $TEMP
/usr/bin/sed -i -e 's/musculo/músculo/g' $TEMP
/usr/bin/sed -i -e 's/toalha papel/toalha de papel/g' $TEMP
/usr/bin/sed -i -e "s/adoro \([kg|pacote|g]\)/a d'oro \1/g" $TEMP
/usr/bin/sed -i -e "s/mocoto/mocotó/g" $TEMP
/usr/bin/sed -i -e "s/a passarinho/à passarinho/g" $TEMP
/usr/bin/sed -i -e "s/aurogets/auroggets/g" $TEMP
/usr/bin/sed -i -e "s/aurogets/auroggets/g" $TEMP
/usr/bin/sed -i -e "s/deter show/detershow/g" $TEMP
/usr/bin/sed -i -e "s/com s abas/com ou sem abas/g" $TEMP
/usr/bin/sed -i -e "s/bebida a base/bebida à base/g" $TEMP
/usr/bin/sed -i -e "s/couve flor/couve-flor/g" $TEMP
/usr/bin/sed -i -e "s/a milanesa/à milanesa/g" $TEMP
/usr/bin/sed -i -e "s/ ( verde) / /g" $TEMP
/usr/bin/sed -i -e "s/ ( verde ) / /g" $TEMP
/usr/bin/sed -i -e "s/ (verde ) / /g" $TEMP
/usr/bin/sed -i -e "s/ (verde) / /g" $TEMP
/usr/bin/sed -i -e "s/\/\/ /\/ /g" $TEMP
/usr/bin/sed -i -e "s/ \/ /\/ /g" $TEMP
/usr/bin/sed -i -e "s/dr.oetker/dr. oetker/g" $TEMP
/usr/bin/sed -i -e "s/isotonico/isotônico/g" $TEMP
/usr/bin/sed -i -e "s/máguary/maguary/g" $TEMP
/usr/bin/sed -i -e "s/itubaina/itubaína/g" $TEMP
/usr/bin/sed -i -e "s/aluminio/alumínio/g" $TEMP
/usr/bin/sed -i -e "s/ ( embalagem retro)/ /g" $TEMP
/usr/bin/sed -i -e "s/ ( embalagem retro )/ /g" $TEMP
/usr/bin/sed -i -e "s/ (embalagem retro )/ /g" $TEMP
/usr/bin/sed -i -e "s/ (embalagem retro)/ /g" $TEMP
/usr/bin/sed -i -e "s/agrim /vinagre /g" $TEMP
/usr/bin/sed -i -e "s/mais doce/maisdoce/g" $TEMP
/usr/bin/sed -i -e "s/hellmanns/hellmann's/g" $TEMP
/usr/bin/sed -i -e "s/oral b 1 2 3/oral-b 1•2•3/g" $TEMP
/usr/bin/sed -i -e "s/oral b 1 -2 - 3/oral-b 1•2•3/g" $TEMP
/usr/bin/sed -i -e "s/oral b 1-2-3/oral-b 1•2•3/g" $TEMP
/usr/bin/sed -i -e "s/oral b 1.2.3/oral-b 1•2•3/g" $TEMP
/usr/bin/sed -i -e "s/ ype / ypê /g" $TEMP
/usr/bin/sed -i -e "s/ elege / elegê /g" $TEMP
/usr/bin/sed -i -e "s/ letty / letti /g" $TEMP
/usr/bin/sed -i -e "s/energetico /energético /g" $TEMP
/usr/bin/sed -i -e "s/ unidade/ unid/g" $TEMP
/usr/bin/sed -i -e "s/ unidade/ unid/g" $TEMP
/usr/bin/sed -i -e "s/ torrado moído / torrado e moído /g" $TEMP
/usr/bin/sed -i -e "s/ economica/ econômica/g" $TEMP
/usr/bin/sed -i -e "s/ sache/ sachê/g" $TEMP
/usr/bin/sed -i -e "s/ po / pó /g" $TEMP
/usr/bin/sed -i -e "s/ po / pó /g" $TEMP
/usr/bin/sed -i -e "s/ instantaneo/ instantâneo/g" $TEMP
/usr/bin/sed -i -e "s/ liquido / líquido /g" $TEMP
/usr/bin/sed -i -e "s/ italia/ itália/g" $TEMP
/usr/bin/sed -i -e "s/ triangulo/ triângulo/g" $TEMP
/usr/bin/sed -i -e "s/linguiça pernil/linguiça de pernil/g" $TEMP
/usr/bin/sed -i -e "s/ a´doro/ a d'oro/g" $TEMP
/usr/bin/sed -i -e "s/ vacuo / vácuo /g" $TEMP
/usr/bin/sed -i -e "s/ lactea / láctea /g" $TEMP
/usr/bin/sed -i -e "s/ bovino role/ bovino à rolê/g" $TEMP
/usr/bin/sed -i -e "s/hercules /hércules /g" $TEMP
/usr/bin/sed -i -e "s/media /média /g" $TEMP
/usr/bin/sed -i -e "s/creveja /cerveja /g" $TEMP
/usr/bin/sed -i -e "s/creveja /cerveja /g" $TEMP
/usr/bin/sed -i -e "s/ limt / limite /g" $TEMP
/usr/bin/sed -i -e "s/ (verde)//g" $TEMP
/usr/bin/sed -i -e "s/ao /ão /g" $TEMP
/usr/bin/sed -i -e "s/hamburguer /hambúrguer /g" $TEMP
/usr/bin/sed -i -e "s/rexas /texas /g" $TEMP
/usr/bin/sed -i -e "s/texas /texas burger /g" $TEMP
/usr/bin/sed -i -e "s/serra azul /serrazul /g" $TEMP
/usr/bin/sed -i -e "s/crem /cream /g" $TEMP
/usr/bin/sed -i -e "s/craker /cracker /g" $TEMP
/usr/bin/sed -i -e "s/minunano /minuano /g" $TEMP
/usr/bin/sed -i -e "s/águardente /aguardente /g" $TEMP
/usr/bin/sed -i -e "s/mussarella /mussarela /g" $TEMP
/usr/bin/sed -i -e "s/muçarella /mussarela /g" $TEMP
/usr/bin/sed -i -e "s/muçarela /mussarela /g" $TEMP
/usr/bin/sed -i -e "s/4elos /4 elos /g" $TEMP
/usr/bin/sed -i -e "s/ delicia / delícia /g" $TEMP
/usr/bin/sed -i -e "s/ com s sal / com ou sem sal /g" $TEMP
/usr/bin/sed -i -e "s/hamburguer/hambúrguer/g" $TEMP
/usr/bin/sed -i -e "s/trazeiro /traseiro /g" $TEMP
/usr/bin/sed -i -e "s/lazanha /lasanha /g" $TEMP
/usr/bin/sed -i -e "s/caf[eé] /café torrado e moído /g" $TEMP
/usr/bin/sed -i -e "s/torrado e moído torrado e moído /torrado e moído /g" $TEMP
/usr/bin/sed -i -e "s/ lt / lata /g" $TEMP
/usr/bin/sed -i -e "s/triangulo/triângulo/g" $TEMP

# Outras correções
/usr/bin/sed -i -e "s/\//\/ /g" $TEMP
/usr/bin/sed -i -e $'s/\*+ vender/a/g' $TEMP
/usr/bin/sed -i -e 's/ü/u/g' $TEMP
/usr/bin/sed -i -e 's/d[ei]stak/destaque/g' $TEMP
/usr/bin/sed -i -e 's/ c\/ osso c\// com osso e com /g' $TEMP
/usr/bin/sed -i -e 's/ c\// com /g' $TEMP
/usr/bin/sed -i -e 's/ s\// sem /g' $TEMP
/usr/bin/sed -i -e 's/ com osso com/ com osso e com /g' $TEMP
/usr/bin/sed -i -e 's/r$ //g' $TEMP
/usr/bin/sed -i -e 's/r$ //g' $TEMP

# Remover marcas das carnes
/usr/bin/sed -i -e 's/\(kg \)amarelinho/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)copacol/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)a´doro/\1/g' $TEMP
/usr/bin/sed -i -e "s/\(kg \)a d'oro/\1/g" $TEMP
/usr/bin/sed -i -e 's/\(kg \)holambra/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)sadia/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)perdig[aã]o/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)friboi/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)angelelli/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)bom sabor/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)frigodellis/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)marfrig/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)alliz/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)don glutão/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)minerva/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)soft pig/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)astra/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)aurora/\1/g' $TEMP
/usr/bin/sed -i -e 's/\(kg \)fricock/\1/g' $TEMP

# Correção final dos espaços extras e tabs
/usr/bin/sed -i -e 's/  */ /g' $TEMP  # deleta espaços extras
/usr/bin/sed -i -e 's/ 	/	/g' $TEMP   # deleta espaços à direita de uma tab
/usr/bin/sed -i -e 's/	 /	/g' $TEMP # deleta espaços à esquerda de uma tab

# Adiciona 'produto' e 'preço' no topo do arquivo
/usr/bin/sed -i -e '1s/^/Produtos	Preco\
/' $TEMP

# Renomeia o arquivo final
/bin/mv $TEMP $CORRIGIDO

# Deleta arquivos temporários
/bin/rm -f /Users/mac/Desktop/em-processo.txt-e
/bin/rm -f $PANFLETO