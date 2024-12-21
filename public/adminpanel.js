let activeTab = 'pokemon';

function switchTab(tabName)
{
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

function fetchPokemon()
{
    fetch('/api/pokedex')
        .then(response => response.json())
        .then(data =>
        {
            const tableBody = document.querySelector('#pokemon-table tbody');
            tableBody.innerHTML = data.map(pokemon =>
            {
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
                            <button class="delete" onclick="deletePokemon(${pokemon.id})">Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
            setupPokemonClickHandlers();
        })
        .catch(err => console.error('Error fetching Pokémon:', err));
}

function fetchItems()
{
    fetch('/api/items')
        .then(response => response.json())
        .then(data =>
        {
            const tableBody = document.querySelector('#items-table tbody');
            tableBody.innerHTML = data.map(item =>
            {
                return `
                    <tr>
                        <td><small>#${item.id}</small></td>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>${item.price}</td>
                        <td>
                            <button class="delete" onclick="deleteItem(${item.id})">Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
        })
        .catch(err => console.error('Error fetching items:', err));
}

function fetchBadges()
{
    fetch('/api/badges')
        .then(response => response.json())
        .then(data =>
        {
            const tableBody = document.querySelector('#badges-table tbody');
            tableBody.innerHTML = data.map(badge =>
            {
                return `
                    <tr class="${badge.isElite ? 'elite' : ''}">
                        <td><small>#${badge.id}</small></td>
                        <td>${badge.name}</td>
                        <td>${badge.description}</td>
                        <td>${badge.price}</td>
                        <td>${badge.isElite ? 'Yes' : 'No'}</td>
                        <td>
                            <button class="delete" onclick="deleteBadge(${badge.id})">Delete</button>
                        </td>
                    </tr>
                `;
            }).join('');
        })
        .catch(err => console.error('Error fetching badges:', err));
}

function setupPokemonClickHandlers()
{
    document.querySelectorAll('.pokemon-img').forEach(img =>
    {
        img.addEventListener('click', () =>
        {
            const pokemonId = img.getAttribute('data-id');
            window.location.href = `/pokemoninfo.html?id=${pokemonId}`;
        });
    });
}

function deletePokemon(pokemonId) {
    if (!confirm('Are you sure you want to delete this Pokémon?')) {
        return;
    }

    fetch(`/api/pokedex/${pokemonId}`, {
        method: 'DELETE',
    })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert(`Error: ${data.error}`);
            } else {
                alert(data.message);
                fetchPokemon();
            }
        })
        .catch(error => {
            console.error('Error deleting Pokémon:', error);
            alert('An error occurred while deleting the Pokémon.');
        });
}

function deleteItem(itemId)
{
    if (!confirm(`Are you sure you want to delete the item with ID ${itemId}?`))
    {
        return;
    }

    fetch(`/api/items/${itemId}`, {
        method: 'DELETE',
    })
        .then(response => {
            if (response.ok) {
                alert(`Item with ID ${itemId} has been deleted.`);
                console.log(`Delete action succeeded for Item with ID: ${itemId}`);
                fetchItems();
            } else {
                response.json().then(data => {
                    console.error('Server responded with error:', data);
                    alert(`Error: ${data.message || 'An error occurred while deleting the item.'}`);
                }).catch(() => {
                    console.error('Failed to parse server response.');
                    alert('An error occurred while deleting the item.');
                });
            }
        })
        .catch(error => {
            console.error(`Error deleting item with ID ${itemId}:`, error);
            alert('Failed to delete the item. Please try again later.');
        });
}

function deleteBadge(badgeId)
{
    if (!confirm(`Are you sure you want to delete the badge with ID ${badgeId}?`))
    {
        return;
    }

    fetch(`/api/badges/${badgeId}`, {
        method: 'DELETE',
    })
    .then(response => {
        if (response.ok) {
            alert(`Badge with ID ${badgeId} has been deleted.`);
            console.log(`Delete action succeeded for Badge with ID: ${badgeId}`);
            fetchBadges();

            const badgeRow = document.querySelector(`#badge-row-${badgeId}`);
            if (badgeRow) {
                badgeRow.remove();
            }
            fetchBadges();
        } else {
            response.text().then(text => {
                console.error('Server responded with error:', text);
                alert(`Error: ${text || 'An error occurred while deleting the badge.'}`);
            }).catch(() => {
                console.error('Failed to parse server response.');
                alert('An error occurred while deleting the badge.');
            });
        }
    })
    .catch(error => {
        console.error(`Error deleting badge with ID ${badgeId}:`, error);
        alert('Failed to delete the badge. Please try again later.');
    });
}

function openModal(modalId)
{
    document.getElementById(modalId).style.display = "flex";
}

function closeModal(modalId)
{
    document.getElementById(modalId).style.display = "none";
}

function initializePokemonFormHandler(formSelector, buttonSelector) {
    const form = document.querySelector(formSelector);
    const submitButton = document.querySelector(buttonSelector);

    if (!form) {
        console.error(`Form with selector '${formSelector}' not found.`);
        return;
    }

    if (!submitButton) {
        console.error(`Button with selector '${buttonSelector}' not found.`);
        return;
    }

    submitButton.addEventListener('click', function (event) {
        event.preventDefault();

        const name = document.querySelector('#pokemon-name').value.trim();
        const level = document.querySelector('#pokemon-level').value.trim();
        const type1 = document.querySelector('#pokemon-type1').value.trim();
        const type2 = document.querySelector('#pokemon-type2').value.trim() || null;
        const hp = document.querySelector('#pokemon-hp').value.trim();
        const ap = document.querySelector('#pokemon-ap').value.trim();
        const sp = document.querySelector('#pokemon-sp').value.trim();
        const isShiny = document.querySelector('#pokemon-shiny').checked;
        const status = document.querySelector('#pokemon-status').value.trim();
        const logo = document.querySelector('#pokemon-logo').value.trim();

        if (!name || !level || !type1 || !hp || !ap || !sp || !status || !logo) {
            alert("All fields except 'Secondary Type' are required. Please fill in all the fields.");
            console.error("Validation Error: Missing required fields.");
            return;
        }

        fetch('http://localhost:3000/add-pokemon', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                name,
                level,
                type1,
                type2,
                hp,
                ap,
                sp,
                isShiny,
                status,
                logo,
            }),
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then((data) => {
                console.log(data.message || 'Pokémon added successfully!');
                alert(data.message || 'Pokémon added successfully!');
                fetchPokemon();
                closeModal('pokemon-modal');
            })
            .catch((error) => {
                console.error('Error adding Pokémon:', error);
                alert('Failed to add Pokémon. Please try again.');
            });
    });
}

function initializeItemFormHandler(formSelector, buttonSelector) {
    const form = document.querySelector(formSelector);
    const submitButton = document.querySelector(buttonSelector);

    if (!form) {
        console.error(`Form with selector '${formSelector}' not found.`);
        return;
    }

    if (!submitButton) {
        console.error(`Button with selector '${buttonSelector}' not found.`);
        return;
    }

    submitButton.addEventListener('click', function (event) {
        event.preventDefault();

        const name = document.querySelector('#item-name').value.trim();
        const description = document.querySelector('#item-description').value.trim();
        const price = document.querySelector('#item-price').value.trim();

        if (!name || !description || !price) {
            alert("All fields are required. Please fill in all the fields.");
            console.error("Validation Error: Missing required fields.");
            return;
        }

        fetch('http://localhost:3000/add-item', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: name,
                description: description,
                price: price
            })
        })
        .then(response => response.json())
        .then(result => {
            if (result.message === 'Item added successfully') {
                alert('Item added successfully!');
                fetchItems();
                closeModal('item-modal');
            } else {
                alert('Error adding item: ' + result.error);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error adding item.');
        });
    });
}

function initializeBadgeFormHandler(formSelector, buttonSelector) {
    const form = document.querySelector(formSelector);
    const submitButton = document.querySelector(buttonSelector);

    if (!form) {
        console.error(`Form with selector '${formSelector}' not found.`);
        return;
    }

    if (!submitButton) {
        console.error(`Button with selector '${buttonSelector}' not found.`);
        return;
    }

    submitButton.addEventListener('click', function (event) {
        event.preventDefault();

        const name = document.querySelector('#badge-name').value.trim();
        const description = document.querySelector('#badge-description').value.trim();
        const price = document.querySelector('#badge-price').value.trim();
        const isElite = document.querySelector('#badge-elite').checked;

        if (!name || !description || !price) {
            alert("All fields are required. Please fill in all the fields.");
            console.error("Validation Error: Missing required fields.");
            return;
        }

        fetch('http://localhost:3000/add-badge', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: name,
                description: description,
                price: price,
                isElite: isElite
            })
        })
        .then(response => response.json())
        .then(result => {
            if (result.message === 'Badge added successfully') {
                alert('Badge added successfully!');
                fetchBadges();
                closeModal('badge-modal');
            } else {
                alert('Error adding badge: ' + result.error);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error adding badge.');
        });
    });
}

// Initialize on DOMContentLoaded
document.addEventListener('DOMContentLoaded', () =>
{
    // Switch to the Pokémon tab
    switchTab('pokemon');
    
    // Fetch Pokémon list
    fetchPokemon();

    // Initialize custom button form handler
    initializePokemonFormHandler('#pokemon-modal form', '#submit-pokemon');
    initializeItemFormHandler('#item-modal form', '#submit-item');
    initializeBadgeFormHandler('#badge-modal form', '#submit-badge');
});