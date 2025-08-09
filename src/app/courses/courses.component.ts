import {ChangeDetectionStrategy, Component} from '@angular/core';

@Component({
  selector: 'app-courses',
  standalone: true,
  templateUrl: './courses.component.html',
  imports: [],

  changeDetection: ChangeDetectionStrategy.OnPush,

  styleUrls: ['./courses.component.css']
})
export class CoursesComponent {
}
