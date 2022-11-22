describe("Navigation from home", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("clicking on product goes to product details pg", () => {
    cy.get(".products > :nth-child(1)").click();
    cy.get(".product-detail").should("exist");
  });
});