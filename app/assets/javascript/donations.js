import $ from 'jquery';


$(document).ready(() => {
    // This function runs when the DOM is fully loaded
  
    // Initializing Stripe with your public API key
    const stripe = Stripe("<%= ENV['STRIPE_PUBLIC_KEY'] %>");
    
    // Creating an instance of the Stripe Elements library
    const elements = stripe.elements();
  
    // Creating a card element and mounting it to the specified HTML element
    const cardElement = elements.create('card');
    cardElement.mount('#card-element');
  
    // Selecting the donation form using jQuery
    const form = $('#donation-form');
  
    // Handling form submission
    form.on('submit', async (event) => {
      event.preventDefault();
  
      // Creating a token for the card using Stripe
      const { token, error } = await stripe.createToken(cardElement);
  
      // Checking for errors during token creation
      if (error) {
        console.error(error);
      } else {
        // If no errors, create a hidden input with the token information
        const hiddenInput = $('<input>').attr({
          type: 'hidden',
          name: 'stripe_token',
          value: token.id,
        });
  
        // Appending the hidden input to the form
        form.append(hiddenInput);
  
        // Submitting the form
        form.get(0).submit();
      }
    });
  });