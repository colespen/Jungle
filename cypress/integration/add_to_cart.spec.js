describe("Navigation from home", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("clicking on add to cart increases cart count", () => {
    // first confirm cart 0 to see a change!! 
    cy.contains(" My Cart (0) ").should("exist");
    cy.contains("Add").click();
    cy.contains(" My Cart (1) ").should("exist");
  });
});