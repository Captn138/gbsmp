ServerEvents.recipes(event => {
    event.remove({output: 'create:wand_of_symmetry'})
})

RecipeViewerEvents.removeEntries('item', event => {
	event.remove('create:wand_of_symmetry')
})
