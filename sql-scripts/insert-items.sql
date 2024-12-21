DELETE FROM Item;
ALTER TABLE Item AUTO_INCREMENT = 1;

INSERT INTO Item (name, description, price) VALUES
('Potion', 'Restores 20 HP of a Pokémon.', 300),
('Super Potion', 'Restores 50 HP of a Pokémon.', 700),
('Hyper Potion', 'Restores 200 HP of a Pokémon.', 1200),
('Max Potion', 'Fully restores HP of a Pokémon.', 2500),
('Revive', 'Revives a fainted Pokémon with half its max HP.', 1500),
('Max Revive', 'Fully revives a fainted Pokémon.', 4000),
('Antidote', 'Cures a poisoned Pokémon.', 100),
('Paralyze Heal', 'Cures a paralyzed Pokémon.', 200),
('Burn Heal', 'Cures a Pokémon of a burn.', 250),
('Ice Heal', 'Cures a Pokémon of being frozen.', 250),
('Full Heal', 'Cures all status conditions of a Pokémon.', 600),
('Rare Candy', 'Increases a Pokémon’s level by 1.', 3000),
('Escape Rope', 'Allows the player to exit a cave or dungeon.', 550),
('Repel', 'Repels weak wild Pokémon for 100 steps.', 350),
('Super Repel', 'Repels weak wild Pokémon for 200 steps.', 500),
('Max Repel', 'Repels weak wild Pokémon for 250 steps.', 700),
('Poké Ball', 'A device for catching wild Pokémon.', 200),
('Great Ball', 'A high-performance Poké Ball with a better catch rate.', 600),
('Ultra Ball', 'An ultra-high-performance Poké Ball with a high catch rate.', 1200),
('Master Ball', 'The best Poké Ball with a 100% catch rate.', 10000);