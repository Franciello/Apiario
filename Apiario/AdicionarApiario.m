//
//  AdicionarApiario.m
//  
//
//  Created by Franciello on 19/07/15.
//
//

#import "AdicionarApiario.h"
#import "Modelo.h"

@interface AdicionarApiario ()
@property (weak, nonatomic) IBOutlet UITextField *txtNomeApiario;
@property (weak, nonatomic) IBOutlet UITextField *txtQuantidade;
@property (weak, nonatomic) IBOutlet UIStepper *stepperQuantidade;

@end

@implementation AdicionarApiario

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toqueAdicionar:(id)sender {
    
//    Apiario *novoApiario = [[Modelo modeloCompartilhado]criarItem];
//    [novoApiario setNome:[[self txtNomeApiario]text]];
//    NSString *quantidadeEmTexto = [[self txtQuantidade]text];
//    [novoApiario setQuantidade:[NSNumber numberWithInt:[quantidadeEmTexto intValue]]];
//    [[Modelo modeloCompartilhado]salvarMudancas];
    //[self.modelo salvarApiarioComNome:self.txtNomeApiario.text eQuantidade:self.txtQuantidade.text];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    self.apiario = [NSEntityDescription insertNewObjectForEntityForName:@"Apiario" inManagedObjectContext:context];
    
    
    
    [self.apiario setValue:self.txtNomeApiario.text forKey:@"nome"];
    [self.apiario setValue:self.txtQuantidade.text forKey:@"quantidade"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Erro ao salvar %@ %@", error, [error localizedDescription]);
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (IBAction)valorDoStepperMudou:(id)sender {
    [[self txtQuantidade]setText:[NSString stringWithFormat:@"%d", (int)[[self stepperQuantidade]value]]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
