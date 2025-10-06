#! /bin/bash

# interacao com o usuario
echo "Digite o nome da empresa"; read EMPRESA;
echo "Digite o endereço do site da empresa (sem o www)"; read URL;
echo "Digite o nome e extenção da imagem"; read ARQUIVO;

# variables
IMAGES="${HOME}/Desktop/`date +%m-%d`/images";
DATA="${HOME}/Desktop/`date +%m-%d`";
NEWSLETTER="${HOME}/Public/${ARQUIVO}";
CORPO=`echo "<html>
	<head>
		<title>tituloSite</title>
	</head>
	<body>
		<table align=\"center\" id=\"newsletter\" width=\"750\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">
			<tr>
				<td colspan=\"3\" align=\"center\"
					style=\"
						padding-top: 20px;
						padding-bottom: 10px;
						font-family: verdana;
						font-size: 11px;
						color: #666666;
					\">
					Se voc&ecirc; n&atilde;o consegue visualizar este e-mail, clique <a href=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/index.html\" style=\"color: #333333;\">aqui</a>.
				</td>
			</tr>
			<tr>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-00.jpg\" alt=\"\" border=\"0\" /></a></td>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-01.jpg\" alt=\"\" border=\"0\" /></a></td>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-02.jpg\" alt=\"\" border=\"0\" /></a></td>
			</tr>
			<tr>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-03.jpg\" alt=\"\" border=\"0\" /></a></td>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-04.jpg\" alt=\"\" border=\"0\" /></a></td>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-05.jpg\" alt=\"\" border=\"0\" /></a></td>
			</tr>
			<tr>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-06.jpg\" alt=\"\" border=\"0\" /></a></td>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-07.jpg\" alt=\"\" border=\"0\" /></a></td>
				<td><a href=\"http://www.siteUrl/\"><img src=\"http://www.siteUrl/newsletter/\`date +%Y/%m-%d\`/images/index-08.jpg\" alt=\"\" border=\"0\" /></a></td>
			</tr>
			<tr>
				<td colspan=\"3\" align=\"center\"
					style=\"
						padding-top: 10px;
						padding-bottom: 20px;
						font-family: verdana;
						font-size: 11px;
						color: #666666;
					\">
					Caso n&atilde;o deseje mais receber esta newsletter, responda esse e-mail com o t&iacute;tulo &quot;remova&quot;.
				</td>
			</tr>
		</table>
	</body>
</html>"`;

# cria o diretorio da newsletter no desktop
mkdir -p "${IMAGES}";

# edita a imagem que sera usada para o newsletter
convert "${NEWSLETTER}" -resize 750 "${DATA}/index_temp.jpg";
convert "${DATA}/index_temp.jpg" -crop 3x3@ +repage +adjoin "${IMAGES}/index-0%d.jpg";
rm "${DATA}/index_temp.jpg";

# cria o html
echo -n "${CORPO}" | sed -e "s/siteUrl/${URL}/g" | sed -e "s/tituloSite/${EMPRESA}/g" > "${DATA}/index.html";
echo "http://www.${URL}" | pbcopy;

# otimizar as imagens
open -a ImageOptim.app ${IMAGES}/*.jpg;