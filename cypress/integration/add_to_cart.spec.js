describe("Navigation from home", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("clicking on add to cart increases cart count", () => {
    cy.contains("Add").click();
    cy.contains(" My Cart (1) ").should("exist");
  });
});