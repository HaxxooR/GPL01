import { LAB_0805TemplatePage } from './app.po';

describe('LAB_0805 App', function() {
  let page: LAB_0805TemplatePage;

  beforeEach(() => {
    page = new LAB_0805TemplatePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
