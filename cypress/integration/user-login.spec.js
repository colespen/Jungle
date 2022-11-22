describe("Navigation from home", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("user can login successfully & taken to home", () => {
    cy.contains("Login").click();
    cy.get("#email").type("dolores@gmail.com");
    cy.get("#password").type("12345678");
    cy.contains("Submit").click();
    cy.contains("Hello, Dolores !");
  });
});