# Gutenberg Blocks Homebrew Formula

Deze Homebrew-formule installeert de Gutenberg Blocks CLI-tool voor het maken en beheren van Gutenberg-blocks in WordPress-thema's en -plugins.

## Installatie

Je kunt de Gutenberg Blocks-formule installeren met behulp van Homebrew:

```bash
brew tap burovoordeboeg/gutenberg-blocks
brew install gutenberg-blocks
```

## Gebruik

Na installatie kun je de Gutenberg Blocks CLI-tool gebruiken door simpelweg het gutenberg-blocks commando uit te voeren. Hier zijn een paar voorbeelden van hoe je het kunt gebruiken:

### Creëer een nieuw Gutenberg block:
```bash
gutenberg-blocks create
```

### Include een Gutenberg block uit de library

>[!LET OP]
> Deze functie is nog niet actief te gebruiken wegens het ontbreken van een block library. 

```bash
gutenberg-blocks include <NAAM_BLOK>
```

### Update de CLI-tool naar de nieuwste versie:

```bash
brew upgrade gutenberg-blocks
```

## Bijwerken van de formule

Als de Gutenberg Blocks CLI-tool wordt bijgewerkt naar een nieuwe versie, moet de Homebrew-formule worden bijgewerkt om de wijzigingen weer te geven. Volg deze stappen om de formule bij te werken:

1. Clone de repository naar je lokale machine:
	```bash
	git clone https://github.com/burovoordeboeg/homebrew-gutenberg-blocks.git
	```
2. Navigeer naar de map van de formule:
	```bash
	cd homebrew-gutenberg-blocks
	```
3. Bewerk het bestand gutenberg-blocks.rb en update de URL naar de nieuwe versie van de CLI-tool.
4. Commit en push je wijzigingen naar de repository.
5. Voer het volgende commando uit om de formule opnieuw te installeren:
	```bash
	brew reinstall gutenberg-blocks
	```

## Bijdragen

Als je een probleem ontdekt of een functieverzoek hebt, kun je een [issue indienen](https://github.com/burovoordeboeg/gutenberg-block-installer/issues). We staan ook open voor [pull-aanvragen](https://github.com/burovoordeboeg/gutenberg-block-installer/pulls)!

