module.exports =
  getImages: (search_term = 'pears')->
    @dispatch('get-pictures', {image_term: search_term})
