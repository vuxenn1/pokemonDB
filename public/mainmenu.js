const typeIcons = {
    Normal: '/images/icons/normal.svg',
    Fire: '/images/icons/fire.svg',
    Water: '/images/icons/water.svg',
    Grass: '/images/icons/grass.svg',
    Electric: '/images/icons/electric.svg',
    Ice: '/images/icons/ice.svg',
    Fighting: '/images/icons/fighting.svg',
    Poison: '/images/icons/poison.svg',
    Ground: '/images/icons/ground.svg',
    Flying: '/images/icons/flying.svg',
    Psychic: '/images/icons/psychic.svg',
    Bug: '/images/icons/bug.svg',
    Rock: '/images/icons/rock.svg',
    Ghost: '/images/icons/ghost.svg',
    Dragon: '/images/icons/dragon.svg',
    Dark: '/images/icons/dark.svg',
    Steel: '/images/icons/steel.svg',
    Fairy: '/images/icons/fairy.svg',
};

function getRandomPokemon() {
    fetch('/api/pokedex')
        .then(response => response.json())
        .then(pokedex => {
            const randomIndex = Math.floor(Math.random() * pokedex.length);
            const pokemon = pokedex[randomIndex];

            document.getElementById('pokemon-img').src = pokemon.url;
            document.getElementById('pokemon-img').alt = pokemon.name;
            document.getElementById('pokemon-name').textContent = pokemon.name;
            document.getElementById('pokemon-level').textContent = pokemon.level;

            const typeIconsContainer = document.getElementById('type-icons');
            typeIconsContainer.innerHTML = `
                <img src="${typeIcons[pokemon.primaryType]}" alt="${pokemon.primaryType}" title="${pokemon.primaryType}">
                ${pokemon.secondaryType ? `<img src="${typeIcons[pokemon.secondaryType]}" alt="${pokemon.secondaryType}" title="${pokemon.secondaryType}">` : ''}
            `;
        })
        .catch(error => console.error('Error fetching Pokémon data:', error));
}

document.addEventListener('DOMContentLoaded', getRandomPokemon);