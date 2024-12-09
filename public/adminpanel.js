let activeTab = 'pokemon';

function switchTab(tabName) {
    if (activeTab === tabName) return;

    document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

    document.querySelector(`.tab[onclick="switchTab('${tabName}')"]`).classList.add('active');
    document.getElementById(`${tabName}-content`).classList.add('active');

    activeTab = tabName;

    if (tabName === 'pokemon') fetchPokemon();
    if (tabName === 'items') fetchItems();
    if (tabName === 'badges') fetchBadges();
}

function fetchPokemon() {
    fetch('/api/pokedex')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.querySelector('#pokemon-table tbody');
            tableBody.innerHTML = data.map(pokemon => {
                return `
                    <tr class="${pokemon.isShiny ? 'shiny' : ''}">
                        <td><small>#${pokemon.id}</small></td>
                        <td>
                            <img src="${pokemon.url}" alt="${pokemon.name}" title="${pokemon.name}" class="pokemon-img" data-id="${pokemon.id}" style="height: 40px; cursor: pointer;">
                        </td>
                        <td>${pokemon.name}</td>
                        <td>${pokemon.level}</td>
                        <td>${pokemon.primaryType}</td>
                        <td>${pokemon.secondaryType || 'N/A'}</td>
                        <td>
                            <button class="edit" onclick="editPokemon(${pokemon.id})">Edit</button>
                            <button class="delete" onclick="deletePokemon(${pokemon.id})">Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
            setupPokemonClickHandlers();
        })
        .catch(err => console.error('Error fetching Pokémon:', err));
}

function fetchItems() {
    fetch('/api/items')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.querySelector('#items-table tbody');
            tableBody.innerHTML = data.map(item => {
                return `
                    <tr>
                        <td><small>#${item.id}</small></td>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>
                            <button class="edit" onclick="editItem(${item.id})">Edit</button>
                            <button class="delete" onclick="deleteItem(${item.id})">Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
        })
        .catch(err => console.error('Error fetching items:', err));
}

function fetchBadges() {
    fetch('/api/badges')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.querySelector('#badges-table tbody');
            tableBody.innerHTML = data.map(badge => {
                return `
                    <tr class="${badge.isElite ? 'elite' : ''}">
                        <td><small>#${badge.id}</small></td>
                        <td>${badge.name}</td>
                        <td>${badge.description}</td>
                        <td>${badge.isElite ? 'Yes' : 'No'}</td>
                        <td>
                            <button class="edit" onclick="editBadge(${badge.id})">Edit</button>
                            <button class="delete" onclick="deleteBadge(${badge.id})">Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
        })
        .catch(err => console.error('Error fetching badges:', err));
}

function setupPokemonClickHandlers() {
    document.querySelectorAll('.pokemon-img').forEach(img => {
        img.addEventListener('click', () => {
            const pokemonId = img.getAttribute('data-id');
            window.location.href = `/pokemoninfo.html?id=${pokemonId}`;
        });
    });
}

function editPokemon(pokemonId) {
    alert(`Editing Pokémon with ID: ${pokemonId}`);
    console.log(`Edit action triggered for Pokémon with ID: ${pokemonId}`);
}

function deletePokemon(pokemonId) {
    alert(`Deleting Pokémon with ID: ${pokemonId}`);
    console.log(`Delete action triggered for Pokémon with ID: ${pokemonId}`);
}

function editItem(itemId) {
    alert(`Editing Item with ID: ${itemId}`);
    console.log(`Edit action triggered for Item with ID: ${itemId}`);
}

function deleteItem(itemId) {
    alert(`Deleting Item with ID: ${itemId}`);
    console.log(`Delete action triggered for Item with ID: ${itemId}`);
}

function editBadge(badgeId) {
    alert(`Editing Badge with ID: ${badgeId}`);
    console.log(`Edit action triggered for Badge with ID: ${badgeId}`);
}

function deleteBadge(badgeId) {
    alert(`Deleting Badge with ID: ${badgeId}`);
    console.log(`Delete action triggered for Badge with ID: ${badgeId}`);
}

document.addEventListener('DOMContentLoaded', () => {
    switchTab('pokemon');
});