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

function getRandomPokemon() 
{
    fetch('/api/pokedex')
        .then(response => response.json())
        .then(pokedex => 
        {
            const randomIndex = Math.floor(Math.random() * pokedex.length);
            const pokemon = pokedex[randomIndex];

            // Get the Pokémon box container
            const pokemonBox = document.querySelector('.random-pokemon-box');

            // Check if the Pokémon is shiny, add the 'shiny' class if true
            if (pokemon.isShiny === 1) 
            {
                pokemonBox.classList.add('shiny');
            } 
            else 
            {
                pokemonBox.classList.remove('shiny');
            }

            // Update Pokémon data on the page
            document.getElementById('pokemon-img').src = pokemon.url;
            document.getElementById('pokemon-img').alt = pokemon.name;
            document.getElementById('pokemon-img').title = pokemon.name;
            document.getElementById('pokemon-name').textContent = pokemon.name;
            document.getElementById('pokemon-level').textContent = pokemon.level;
            document.getElementById('pokemon-info').textContent = pokemon.name;

            // Update the link to the Pokémon's personal page
            const infoLink = document.querySelector('.attributes a');
            infoLink.href = `/pokemoninfo.html?id=${pokemon.id}`;
            infoLink.title = `More information about ${pokemon.name}`;

            const typeIconsContainer = document.getElementById('type-icons');
            typeIconsContainer.innerHTML = `
                <img class="type-icon" src="${typeIcons[pokemon.primaryType]}" alt="${pokemon.primaryType}" title="${pokemon.primaryType}">
                ${pokemon.secondaryType ? `<img class="type-icon" src="${typeIcons[pokemon.secondaryType]}" alt="${pokemon.secondaryType}" title="${pokemon.secondaryType}">` : ''}
            `;
        })
        .catch(error => console.error('Error fetching Pokémon data:', error));
}

document.addEventListener('DOMContentLoaded', getRandomPokemon);